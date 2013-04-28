require 'spec_helper'

describe Admin::Contests::ProblemsController do

  let(:contest) { create(:contest) }
  let(:problem) { contest.problems[0] }

  describe 'GET /index' do

    it 'should respond success' do
      get :index, contest_id: contest
      expect(response).to be_success
    end

  end

  describe 'GET /new' do

    it 'should respond success' do
      get :new, contest_id: contest
      expect(response).to be_success
    end

  end

  describe 'GET /show/:id' do

    it 'should respond success' do
      get :show, contest_id: contest, id: problem
      expect(response).to be_success
    end

  end

  describe 'GET /edit/:id' do

    it 'should respond success' do
      get :edit, contest_id: contest, id: problem
      expect(response).to be_success
    end

  end

end
