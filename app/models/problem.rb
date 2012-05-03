class Problem

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
  field :input
  field :output
  field :limit
  field :sample_input
  field :sample_output
  field :small_input
  field :small_answer
  field :large_input
  field :large_answer
  field :published, type: Boolean, default: false

end
