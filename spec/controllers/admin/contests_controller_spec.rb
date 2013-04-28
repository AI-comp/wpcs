require 'spec_helper'

describe Admin::ContestsController do

  let(:contest) { create(:contest) }

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

  describe 'GET /show/:id' do

    it 'should respond success' do
      get :show, id: contest
      expect(response).to be_success
    end

  end

  describe 'GET /edit/:id' do

    it 'should respond success' do
      get :edit, id: contest
      expect(response).to be_success
    end

  end

end
