class Submit

  include Mongoid::Document
  include Mongoid::Timestamps

  field :solved, type: Boolean, default: false
  field :problem_type
  field :score, type: Integer, default: 0

  belongs_to :problem
  belongs_to :user

end
