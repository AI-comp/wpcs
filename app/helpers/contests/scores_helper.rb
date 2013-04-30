module Contests::ScoresHelper
  def submits_to_show
    if @current_user.is_admin?
      @submits
    else
      # Hide admin submits from non-admin users
      @submits.select{|s| !s.attendance.user.is_admin}
    end
  end
end
