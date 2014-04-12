require 'redcarpet'

class Problem < ActiveRecord::Base

  attr_accessible :title
  attr_accessible :description
  attr_accessible :description_html
  attr_accessible :small_input
  attr_accessible :small_output
  attr_accessible :large_input
  attr_accessible :large_output
  attr_accessible :small_score, type: Integer
  attr_accessible :large_score, type: Integer

  belongs_to :contest
  has_many :submissions

  has_many :edges_from, class_name: ProblemEdge, foreign_key: :from_problem_id, dependent: :destroy
  has_many :edges_to, class_name: ProblemEdge, foreign_key: :to_problem_id, dependent: :destroy
  has_many :from_problems, through: :edges_to, source: :to_problem
  has_many :to_problems, through: :edges_from, source: :from_problem

  before_save :convert_html

  def prefix
    title.split(' ')[0]
  end

  def convert_html
    self.description_html = Markdown.to_html(self.description)
  end

  TYPES = [ :small, :large ]
  def self.types
    TYPES
  end

  def input(type)
    case type
    when :small then small_input
    when :large then large_input
    else nil
    end
  end

  def output(type)
    case type
    when :small then small_output
    when :large then large_output
    else nil
    end
  end

  def score(type)
    case type
    when :small then small_score
    when :large then large_score
    else nil
    end
  end

  def correct?(answer, type)
    output(type).split == answer.split
  end

  def index
    contest.problems.index(self)
  end

  # score calculation: max_score * (1 - 0.5 * time_diff / time_length)
  def calculate_score(type)
    time_length = contest.end_time - contest.start_time
    time_diff   = Time.now - contest.start_time
    (score(type) * (1 - 0.5 * time_diff / time_length)).to_int
  end

end
