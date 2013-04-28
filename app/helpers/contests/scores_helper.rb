module Contests::ScoresHelper
  def scores_to_show
    if @current_user.is_admin?
      @scores
    else
      # Hide admin scores from non-admin users
      @scores.select{|s| !s.user.is_admin}
    end
  end
end
