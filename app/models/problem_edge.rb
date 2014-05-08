class ProblemEdge < ActiveRecord::Base
  attr_accessible :from_problem_id, :to_problem_id

  belongs_to :from_problem, class_name: Problem, foreign_key: :from_problem_id
  belongs_to :to_problem, class_name: Problem, foreign_key: :to_problem_id
end
