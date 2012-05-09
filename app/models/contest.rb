class Contest

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :introduction
  field :start_time, type: DateTime
  field :end_time, type: DateTime


  has_many :problems

end
