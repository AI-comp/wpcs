class ContestsController < AuthController
  before_filter :admin_filter, only: ['new','edit', 'create', 'update']
  before_filter :check_attendance, only: ['show']

  # GET /contests
  def index
    # 開催期間に当てはまるコンテストだけ表示する
    @contests = Contest.visible.order(:start_time)
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
  
  def check_attendance
    @contest = Contest.find(params[:id])
    redirect_to contests_path unless @current_user.attended? @contest
  end

end
