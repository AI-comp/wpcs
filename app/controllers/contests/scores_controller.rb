class Contests::ScoresController < ApplicationController
  before_filter :load_contest
  private
  def load_contest
    @contest = Contest.find(params[:contest_id])
  end

  public
  # GET /contests/1/score
  # GET /contests/1/score.json
  def show
    @submits = @contest.problems.flat_map {|p| p.submits }

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problems }
    end
  end
end
