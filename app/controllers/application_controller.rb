class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user


  TOKEN_CHAR_ARRAY = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
  def generate_random_token(length=10)
    token = ''
    length.times do
      token += TOKEN_CHAR_ARRAY[rand(TOKEN_CHAR_ARRAY.length)]
    end
    token
  end

  def login_user(user)
    session[:user_name] = user.name
  end

  def logout_user
    session[:user_name] = nil
  end

  def current_user
    @current_user = User.where(:name=>session[:user_name]).first
    @authorized = if @current_user.nil?
                    false
                  else
                    true
                  end
    @current_user
  end

end
