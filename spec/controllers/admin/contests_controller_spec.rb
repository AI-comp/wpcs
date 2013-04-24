require 'spec_helper'

describe Admin::ContestsController do

  describe 'GET /index' do

    before do
      get :index
    end

    it 'should return 200 status' do
      expect(response).to be_success
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
