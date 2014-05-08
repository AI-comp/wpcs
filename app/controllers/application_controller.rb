class ApplicationController < ActionController::Base

  class InvalidContestError < ActionController::ActionControllerError
  end

  protect_from_forgery
  before_filter :current_user

  rescue_from ActionController::RoutingError,
              InvalidContestError,
              with: :render_404
  rescue_from Exception, with: :render_500

  def render_404(exception)
    @title = exception.class
    @message = exception.message
    @params = request.params
    @session = session
    @backtrace = exception.backtrace
    render file: "#{Rails.root}/public/404", status: 404, layout: false
  end

  def render_500(exception)
    @title = exception.class
    @message = exception.message
    @params = request.params
    @session = session
    @backtrace = exception.backtrace
    render file: "#{Rails.root}/public/500", status: 500, layout: false
  end

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
      redirect_to login_users_path
    end
  end

end
