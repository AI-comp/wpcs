class ContestsController < AuthController
  before_filter :admin_filter, only: ['new','edit', 'create', 'update']

  # GET /contests
  def index
    # 開催期間に当てはまるコンテストだけ表示する
    now = Time.now
    @contests = Contest
      .where(:start_time.lte => now, :end_time.gte => now)
      .asc(:start_time)
  end

  # GET /contests/1
  def show
    @contest = Contest.find(params[:id])
  end

end
