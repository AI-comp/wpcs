class Contest

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :introduction

  has_many :problems

end
