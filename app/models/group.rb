class Group

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  validates_uniqueness_of :name

  has_many :users

  def self.default_group_name
    "No Group"
  end

  def self.default
    Group.where(name: Group.default_group_name).first
  end

  def attendances_for(contest)
    Attendance.where(contest_id: contest.id)
      .in(user_id: user_ids)
  end

  def correct_submission_for(attendances, problem, type)
    attendances.map { |att| att.correct_submission_for(problem, type) }
      .select { |sub| sub }
      .first
  end

  def score_for(contest)
    total_score = 0
    attendances = attendances_for(contest)
    for problem in contest.problems
      for type in [:small, :large]
        s = correct_submission_for(attendances, problem, type)
        total_score += s.score if s
      end
    end
    total_score
  end

end
