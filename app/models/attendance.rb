class Attendance

  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :contest
  has_many :submissions

  def submissions_for(problem, type)
    submissions.where(problem_id: problem.id, problem_type: type).first
  end

  def solved_submission_for(problem, type)
    submissions.where(problem_id: problem.id, problem_type: type, solved: true).first
  end

  def submit(problem, answer, type)
    solved = problem.correct?(answer, type)
    score = solved ? problem.calculate_score(type) : 0
    Submission.create(
      solved: solved,
      problem_type: type,
      problem: problem,
      attendance: self,
      score: score
    )
  end

end
