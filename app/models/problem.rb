class Problem

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content_path
  field :small_input
  field :small_output
  field :large_input
  field :large_output
  field :score, type: Integer

  has_many :submits
  belongs_to :contest

end
