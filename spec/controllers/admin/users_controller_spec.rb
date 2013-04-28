require 'spec_helper'

describe Admin::UsersController do

  describe 'GET /index' do

    before do
      get :index
    end

    it 'should respond success' do
      expect(response).to be_success
    end

    it 'should show all users' do
      users = assigns[:users]
      expect(users).not_to be_nil
      # TODO
      # check the size of users
    end

  end

  describe 'GET /new' do

    it 'should respond success' do
      get :new
      expect(response).to be_success
    end

  end

end
