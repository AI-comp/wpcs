class Contests::ProblemsController < ApplicationController
  # GET /problems
  # GET /problems.json
  def index
    contest = Contest.find(params[:contest_id])
    @problems = contest.problems

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problems }
    end
  end

  # GET /problems/new
  # GET /problems/new.json
  def new
    @problem = Problem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @problem }
    end
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(params[:problem])
    @problem.contest_id = params[:contest_id]

    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'Problem was successfully created.' }
        format.json { render json: @problem, status: :created, location: @problem }
      else
        format.html { render action: "new" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end
end
