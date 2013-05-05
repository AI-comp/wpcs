module Contests::ScoresHelper
  def groups_to_show
    groups = @current_user.is_admin? ? Group.all : Group.all.reject(&:include_admin?)
    groups.sort_by { |group| group.score_for( @contest ) }
  end
end
