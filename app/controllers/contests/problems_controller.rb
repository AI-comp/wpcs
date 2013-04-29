# -*- coding: utf-8 -*-

class Contests::ProblemsController < AuthController
  before_filter :load_contest
  private
  def load_contest
    @contest = Contest.find(params[:contest_id])
    @score = @contest.scores.where(user_id: @current_user.id)
      .first
    unless @score
      @score = Score.new(contest: @contest, user: @current_user)
      @score.save
    end
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
    input_type = params[:input_type]

    file = params[:files]
    if file
      if file.size > 100.kilobyte
        raise 'Too large file size'
      end
      output = file.read
    else
      output = params[:text_area]
    end

    now_solved = false
    @solved = problem.correct?(output, input_type)
    if @current_user.is_admin || (@contest.start_time <= Time.now && Time.now <= @contest.end_time)
      if @solved && !@score.solved_time(problem, input_type)
        max_score = input_type == 'small' ? problem.small_score : problem.large_score
        score = @score.score + calculate_score(max_score)
        @score.update_attributes(score: score)
        now_solved = true
      end
      Submit.create(solved: @solved, problem_type: input_type, problem: problem, score: @score)
    end

    if(@solved) # the problem was solved on this time
      if(now_solved)
        flash[:problem_score] = score
      else #the problem has been already solved
        flash[:problem_score] = -1;
      end
    else # the problem was NOT solved on this time
      if @score.solved_time(problem, input_type) #the problem has been already solved
        flash[:problem_score] = -2
      else #the problem has been already solved
        flash[:problem_score] = 0
      end
    end

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
