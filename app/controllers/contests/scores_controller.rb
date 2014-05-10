class Contests::ScoresController < ApplicationController
  before_filter :load_contest
  before_filter :check_attendance

  private
  def load_contest
    @contest = Contest.find(params[:contest_id])
    @problems = @contest.problems.order(:title).to_a
    raise InvalidContestError, 'contest is not started yet' unless @contest.started?
  end

  public
  # GET /contests/1/score
  # GET /contests/1/score.json
  def show
    include_admin = @current_user.is_admin?
    @submissions_table = @contest.all_submissions_table(include_admin)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problems }
    end
  end

  def check_attendance
      redirect_to contests_path unless @current_user.attended? @contest
  end
end
