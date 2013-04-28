require 'spec_helper'

describe Admin::ContestsController do

  describe 'GET /index' do

    it 'should respond success' do
      get :index
      expect(response).to be_success
    end

  end

  describe 'GET /new' do

    it 'should respond success' do
      get :new
      expect(response).to be_success
    end

  end

end
