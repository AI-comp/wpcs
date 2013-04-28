require 'spec_helper'

describe Admin::Contests::ProblemsController do

  let(:contest) { create(:wupc) }
  let(:problem) { contest.problems[0] }

  describe 'GET /index' do

    it 'should respond success' do
      get :index, contest_id: contest
      expect(response).to be_success
    end

  end

  describe 'GET /:id/show' do

    it 'should respond success' do
      get :show, contest_id: contest, id: problem
      expect(response).to be_success
    end

  end

end
