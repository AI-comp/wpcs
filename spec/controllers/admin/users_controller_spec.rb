require 'spec_helper'

describe Admin::UsersController do

  include_examples 'respond success', :index
  include_examples 'respond success', :new

  describe 'GET /index' do

    before do
      get :index
      # TODO
      # create some users
    end

    it 'should show all users' do
      users = assigns[:users]
      expect(users).not_to be_nil
      # TODO
      # check the size of users
    end

  end

end
