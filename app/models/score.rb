class Score

  include Mongoid::Document

  field :score, type: Integer, default: 0
  field :contest_id

  belongs_to :contest
  belongs_to :user
  has_many :submits

  def solved_time(problem, problem_type)
    submit = submits.where(
        problem_id: problem.id,
        problem_type: problem_type,
        solved: true)
      .asc(:updated_at)
      .first or return nil
    submit.updated_at
  end

  def wrong_count(problem, problem_type)
    submits.where(
        problem_id: problem.id,
        problem_type: problem_type,
        solved: false)
      .count
  end

end

