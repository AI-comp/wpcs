module Contests::ScoresHelper
  def groups_to_show(contest)
    groups = @current_user.is_admin? ? Group.all : Group.all.reject(&:include_admin?)
    groups = groups.select { |group|
      group.users.any? { |user|
        user.attendances.any? { |att|
          att.contest == contest } } }
    groups.sort_by { |group| -group.score_for( @contest ) }
  end

  def score_label(problem, type)
    longest_score_length = [problem.small_score, problem.large_score].map { |s| s.to_s.length }.max
    score = problem.score(type)
    type.to_s[0].upcase + ':' + ('%' + longest_score_length.to_s + 'd') % score
  end
end
