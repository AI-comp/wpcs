class Problem

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content_path
  field :small_input
  field :small_output
  field :large_input
  field :large_output
  field :small_score, type: Integer
  field :large_score, type: Integer

  belongs_to :contest

  def correct?(answer, problem_type)
    if problem_type=='small'
      small_output.split == answer.split
    else
      large_output.split == answer.split
    end
  end

end
