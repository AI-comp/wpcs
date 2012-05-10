class AuthController < ApplicationController
  before_filter :login_filter
end
