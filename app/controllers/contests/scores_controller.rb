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
    groups = @current_user.is_admin? ? Group.all : Group.all.reject(&:include_admin?)
    attendance_ids = []
    gid_from_aid = {}
    groups.each do |g|
      atts = Attendance.where(user_id: g.user_ids).select(:id)
      attendance_ids += atts.map { |a| a.id }
      atts.each { |a| gid_from_aid[a.id] = g.id }
    end

    submissions = Submission.where(
      problem_id: @contest.problem_ids,
      solved: true,
      attendance_id: attendance_ids
    )

    @submissions_table = {}
    submissions.each do |s|
      gid = gid_from_aid[s.attendance_id]
      pid = s.problem_id
      type = s.problem_type
      @submissions_table[gid] ||= {}
      @submissions_table[gid][pid] ||= {}
      @submissions_table[gid][pid][type] = s
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problems }
    end
  end

  def check_attendance
      redirect_to contests_path unless @current_user.attended? @contest
  end
end
