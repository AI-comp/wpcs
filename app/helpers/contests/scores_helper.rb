module Contests::ScoresHelper
  def groups_to_show
    groups = Group.each
    groups = groups.select { |g| g.users.all? { |u| not u.is_admin? } } unless @current_user.is_admin?
    groups.sort { |a, b| a.score_for(@contest) <=> b.score_for(@contest) }
  end
end
