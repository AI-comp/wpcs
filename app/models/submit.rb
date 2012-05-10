class Submit

  include Mongoid::Document
  include Mongoid::Timestamps

  field :solved, type: Boolean, default: false
  field :problem_type
  field :wrong_count, type: Integer

  belongs_to :user
  belongs_to :problem

end
