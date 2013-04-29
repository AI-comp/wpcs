class Submit

  include Mongoid::Document
  include Mongoid::Timestamps

  field :solved, type: Boolean, default: false
  field :problem_type
  field :score, type: Integer, default: 0
  field :solved_time, type: DateTime

  belongs_to :problem
  belongs_to :user

  def solved?
    self.solved_time.present?
  end

end
