# -*- coding: utf-8 -*-

class Contests::ProblemsController < AuthController
  include Contests::ProblemsHelper

  before_filter :load_contest
  before_filter :check_attendance

  private
  def load_contest
    @contest = Contest.find(params[:contest_id])
    raise InvalidContestError, 'contest is not started yet' unless @contest.started?
  end

  public
  # GET /contests/1/problems
  # GET /contests/1/problems.json
  def index
    @problems = @contest.problems
    @users = User.contestants_of(@contest)
    @current_user.attend(@contest) unless @current_user.attended? @contest

    @json_nodes = JSON.generate(@problems.map { |p| { id: p.id, title: p.title, text: p.description, x: p.x, y: p.y } })

    # FIXME: (>_<)
    @json_edges = JSON.generate(ProblemEdge.all.map { |pe| { f: pe.from_problem_id - 1, t: pe.to_problem_id - 1, curve: 0 } });

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
    file = params[:files]

    redirect_to({ action: 'index' }, alert: 'Contest is already closed.') and return if @contest.ended?
    redirect_to({ action: 'show' }, alert: 'Too large file') if file && file.size > 100.kilobyte

    problem = Problem.find(params[:id])
    input_type = params[:input_type].to_sym
    output = file ? file.read : params[:text_area]

    attendance = @current_user.attendance_for(@contest)
    submission = attendance.submit(problem, output, input_type)

    flash[:solved] = submission.solved
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

    id = p.index + 1
    title = p.title.gsub(' ', '_')

    send_data(p.input(type), filename: "#{id}. #{title}_#{type}.txt")
  end

  def check_attendance
      redirect_to contests_path unless @current_user.attended? @contest
  end

end
