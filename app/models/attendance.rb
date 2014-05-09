class Attendance < ActiveRecord::Base

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
    Submission.create! do |s|
      s.solved = solved
      s.problem_type = type.to_s
      s.score = score
      s.problem_id = problem.id
      s.attendance_id = self.id
    end
  end

end
