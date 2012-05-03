class ApplicationController < ActionController::Base
  protect_from_forgery


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

  def current_user
    User.where(:name=>session[:user_name]).first
  end

end
