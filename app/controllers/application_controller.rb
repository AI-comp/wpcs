class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user


  def login_user(user)
    session[:provider] = user.provider
    session[:uid] = user.uid
  end

  def logout_user
    session[:provider] = nil
    session[:uid] = nil
  end

  def current_user
    @current_user = User.where(provider: session[:provider], uid: session[:uid]).first
    @authorized = if @current_user.nil?
                    false
                  else
                    true
                  end
    @current_user
  end

  def login_filter
    if !@authorized
      redirect_to controller: 'users', action: 'login'
    end
  end

  def admin_filter
    if(@current_user && !@current_user.is_admin)
      redirect_to controller: 'top', action: 'index'
    end
  end


end
