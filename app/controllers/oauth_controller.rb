class OauthController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    login_user(user)
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
