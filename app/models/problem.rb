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

  belongs_to :contest
  has_many :submits

  before_save :convert_html


  def convert_html
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    self.description_html = md.render(self.description)
  end

  def correct?(answer, problem_type)
    if problem_type=='small'
      small_output.split == answer.split
    else
      large_output.split == answer.split
    end
  end

end
