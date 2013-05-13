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
