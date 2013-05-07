class ContestsController < AuthController
  before_filter :admin_filter, only: ['new','edit', 'create', 'update']

  # GET /contests
  def index
    # 開催期間に当てはまるコンテストだけ表示する
    @contests = Contest.visible.asc(:start_time)
  end

  # GET /contests/1
  def show
    @contest = Contest.find(params[:id])
    raise InvalidContestError, 'contest is not started yet' unless @contest.started?
  end

  def attend
      @contest = Contest.find(params[:id])
      @current_user.attend(@contest) unless @current_user.attended? @contest
      redirect_to :controller=> "contests/problems", :action=> "index", :contest_id=> params[:id]
  end

end
