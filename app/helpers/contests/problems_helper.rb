module Contests::ProblemsHelper
  def submissions_to_show
    submissions = Submission.in(attendance: @contest.attendance_ids).desc(:updated_at)
    @current_user.is_admin? ? submissions : submissions.take(10)
  end
end
