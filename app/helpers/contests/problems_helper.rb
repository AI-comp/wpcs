module Contests::ProblemsHelper
  # score calculation: max_score * (1 - 0.5 * time_diff / time_length)
  def calculate_score(max_score)
    time_length = @contest.end_time - @contest.start_time
    time_diff   = Time.now - @contest.start_time
    (max_score * (1 - 0.5 * time_diff / time_length)).to_int
  end

  def submissions_to_show
    submissions = Submission
      .where(attendance_id: @contest.attendance_ids)
      .order("updated_at DESC")
    @current_user.is_admin? ? submissions : submissions.take(10)
  end
end
