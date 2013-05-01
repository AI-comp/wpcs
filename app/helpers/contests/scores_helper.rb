module Contests::ScoresHelper
  def groups_to_show
    if @current_user.group.users.any? { |u| u.is_admin? }
      Group.each.select { |g| g.users.any? { |u| u.is_admin? } }
    else
      Group.each.select { |g| g.users.all? { |u| !u.is_admin? } }
    end
  end
end
