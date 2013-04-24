require 'spec_helper'

describe Admin::UsersController do

  describe 'GET /index' do

    before do
      get :index
      # TODO
      # create some users
    end

    it 'should return 200 status' do
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

    before do
      get :new
    end

    it 'should return 200 status' do
      expect(response).to be_success
    end

  end

end
