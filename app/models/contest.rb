class Contest

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :introduction
  field :start_time, type: Time
  field :end_time, type: Time

  has_many :problems

end
