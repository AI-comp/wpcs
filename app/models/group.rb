class Group

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  validates_uniqueness_of :name

  has_many :users

end
