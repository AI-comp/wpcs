class Contests::ScoresController < ApplicationController
  before_filter :load_contest
  before_filter :check_attendance

  private
  def load_contest
    @contest = Contest.find(params[:contest_id])
    @problems = @contest.problems.asc(:title).each
    raise InvalidContestError, 'contest is not started yet' unless @contest.started?
  end

  public
  # GET /contests/1/score
  # GET /contests/1/score.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problems }
    end
  end

  def check_attendance
      redirect_to contests_path unless @current_user.attended? @contest
  end
end
