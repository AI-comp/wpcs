class AdminController < ApplicationController

  class AuthError < ActionController::ActionControllerError
  end

  before_filter :admin_filter

  rescue_from AuthError, with: :render_404

  def admin_filter
    unless @current_user && @current_user.is_admin
      raise AuthError, "Non-admin user can't access to admin page"
    end
  end

end
