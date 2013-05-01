# -*- coding: utf-8 -*-

class Contests::ProblemsController < AuthController
  before_filter :load_contest
  private
  def load_contest
    @contest = Contest.find(params[:contest_id])
  end

  # score calculation: max_score * (1 - 0.5 * time_diff / time_length)
  def calculate_score(max_score)
    time_length = @contest.end_time - @contest.start_time
    time_diff   = Time.now - @contest.start_time
    (max_score * (1 - 0.5 * time_diff / time_length)).to_int
  end

  public
  # GET /contests/1/problems
  # GET /contests/1/problems.json
  def index
    @problems = @contest.problems
    @users = User.where(is_admin: false, 'scores.contest_id' => @contest.id)
    @current_user.attend(@contest) unless @current_user.attended? @contest

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problems }
    end
  end

  # GET /contests/1/problems/1
  # GET /contests/1/problems/1.json
  def show
    @problem = Problem.find(params[:id])
    @input_type = params[:input_type]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem }
    end
  end

  # POST /contests/1/problems/1/submit
  def submit
    problem = Problem.find(params[:id])
    input_type = params[:input_type].to_sym

    file = params[:files]
    if file
      raise 'Too large file size' if file.size > 100.kilobyte
      output = file.read
    else
      output = params[:text_area]
    end

    attendance = @current_user.attendance_for(@contest)
    max_score = problem.score_or_nil(output, input_type)
    if Time.now.between?(@contest.start_time, @contest.end_time)
      if max_score
        solved = true
        score = calculate_score(max_score)
      else
        solved = false
        score = 0
      end
      Submission.create(solved: solved, problem_type: input_type, problem: problem, attendance: attendance, score: score)
    end

    flash[:solved] = solved
    redirect_to action: 'index'
  end

  def download_small
    download(:small)
  end

  def download_large
    download(:large)
  end

  def download(type)
    p = Problem.find(params[:id])
    name = (p.index + 1).to_s + '. ' + p.title.gsub(' ', '_') + '_'

    case type
    when :small
      send_data(p.small_input, filename: name + 'small.txt')
    when :large
      send_data(p.large_input, filename: name + 'large.txt')
    end
  end

end
