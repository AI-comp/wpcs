class Contests::ScoreController < ApplicationController
  before_filter :load_contest
  private
  def load_contest
    @contest = Contest.find(params[:contest_id])
  end

  public
  # GET /contests/1/score
  # GET /contests/1/score.json
  def index
    @scores = Score.where(contest: @contest)
      .asc(:score)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problems }
    end
  end
end
