class Group

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name

  validates_uniqueness_of :name

  has_many :users

  def self.default_group_name
    "No Group"
  end

  def self.default
    Group.where(name: Group.default_group_name).first
  end

end
