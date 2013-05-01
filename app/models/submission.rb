class Submission

  include Mongoid::Document
  include Mongoid::Timestamps

  field :problem_type
  field :solved, type: Boolean, default: false
  field :score, type: Integer, default: 0

  belongs_to :problem
  belongs_to :attendance

end
