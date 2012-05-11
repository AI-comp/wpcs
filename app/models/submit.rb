class Submit

  include Mongoid::Document
  include Mongoid::Timestamps

  field :solved, type: Boolean, default: false
  field :problem_type

  belongs_to :user
  belongs_to :problem

end
