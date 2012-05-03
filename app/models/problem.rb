class Problem

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
  field :input
  field :output

end
