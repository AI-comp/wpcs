require 'redcarpet'

class Problem

  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :description
  field :description_html
  field :small_input
  field :small_output
  field :large_input
  field :large_output
  field :small_score, type: Integer
  field :large_score, type: Integer
  field :is_solved, type: Boolean, default: false

  belongs_to :contest
  has_many :submissions

  before_save :convert_html

  def convert_html
    self.description_html = Markdown.to_html(self.description)
  end

  def correct?(answer, problem_type)
    if problem_type == :small
      small_output.split == answer.split
    else
      large_output.split == answer.split
    end
  end

  def index
    contest.problems.index(self)
  end

end
