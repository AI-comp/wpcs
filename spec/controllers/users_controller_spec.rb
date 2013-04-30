require 'spec_helper'

describe UsersController do

  describe 'GET /login' do

    it 'should respond success' do
      get :login
      expect(response).to be_success
    end

  end

  describe 'GET /register' do

    it 'should respond success' do
      get :register
      expect(response).to be_success
    end

  end

end
