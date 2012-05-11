class Submit

  include Mongoid::Document
  include Mongoid::Timestamps

  field :solved, type: Boolean, default: false
  field :problem_type

  belongs_to :problem
  belongs_to :score

end
