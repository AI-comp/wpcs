class AdminController < ApplicationController
  before_filter :admin_filter

  def admin_filter
    unless @current_user && @current_user.is_admin
      redirect_to root_path
    end
  end

end
