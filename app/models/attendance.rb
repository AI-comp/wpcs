class Attendance

  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :contest
  has_many :submissions

  def submissions_for(problem, type)
    submissions.where(problem_id: problem.id, problem_type: type).first
  end

  def correct_submission_for(problem, type)
    submissions.where(problem_id: problem.id, problem_type: type, solved: true).first
  end

end
