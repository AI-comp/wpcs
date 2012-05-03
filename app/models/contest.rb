class Contest

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :introduction

  embeds_many :problems

end
