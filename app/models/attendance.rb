class Attendance

  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :contest
  has_many :submits

  def submit_for(problem, type)
    self.submits.where(problem_id: problem.id, problem_type: type).first
  end

end
