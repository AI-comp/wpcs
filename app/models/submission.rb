class Submission < ActiveRecord::Base

  attr_accessible :problem_type
  attr_accessible :solved
  attr_accessible :score

  belongs_to :problem
  belongs_to :attendance

end
