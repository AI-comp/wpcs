class Group < ActiveRecord::Base

  attr_accessible :name

  validates_uniqueness_of :name

  has_many :users

  def self.default_group_name
    "No Group"
  end

  def self.default
    Group.where(name: Group.default_group_name).first_or_create!
  end

  def include_admin?
    users.any? &:is_admin?
  end

  def attendances_for(contest)
    Attendance.where(contest_id: contest.id, user_id: user_ids)
  end

  def solved_submission_for(problem, type)
    Submission.where(
        problem_id: problem.id,
        problem_type: type,
        solved: true,
        attendance_id: Attendance.where(user_id: user_ids).select(:id))
      .order("score DESC")
      .first
  end

  def solved?(problem, type, attendances = attendances_for(problem.contest))
    attendances_for(problem.contest)
      .any? { |att| att.solved_submission_for(problem, type).present? }
  end

  def score_for(contest)
    Submission.where(
        problem_id: contest.problem_ids,
        solved: true,
        attendance_id: Attendance.where(user_id: user_ids).select(:id))
      .group(:problem_id, :problem_type)
      .maximum(:score)
      .values
      .sum
  end

  def variance_for(contest)
    group = Submission.where(
        problem_id: contest.problem_ids,
        solved: true,
        attendance_id: Attendance.where(user_id: user_ids).select(:id))
      .group(:problem_id, :problem_type)
      .maximum(:score)
    uid2score = Hash[user_ids.map { |id| [id, 0] }]
    group.each do |k, v|
      s = Submission.where(
          problem_id: k[0],
          problem_type: k[1],
          score: v,
          solved: true,
          attendance_id: Attendance.where(user_id: user_ids).select(:id)).first
      uid2score[s.attendance.user_id] += s.score
    end
    avg = uid2score.map { |uid, score| score }.sum.to_f / uid2score.size
    uid2score.map { |uid, score| (score - avg) * (score - avg) }.sum / uid2score.size
  end

end
