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

  def score_for(contest)
    score = 0
    attendances = Attendance.where(contest_id: contest.id).in(user_id: user_ids)
    for problem in contest.problems
      for type in [:small, :large]
        score += attendances.map { |att| att.correct_submission_for(problem, type) }
          .select { |sub| sub }
          .map { |sub| sub.score }
          .max
      end
    end
    score
  end

end
