class Submit

  include Mongoid::Document
  include Mongoid::Timestamps

  field :solved, type: Boolean, default: false
  field :problem_id
  field :problem_type

  embedded_in :score

end
