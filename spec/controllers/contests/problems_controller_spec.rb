require 'spec_helper'

describe Contests::ProblemsController do

  # TODO
  # check time
  let(:contest) { create(:contest) }
  let(:problem) { contest.problems[0] }

  describe 'GET /index' do

    it 'should respond 404' do
      get :index, contest_id: contest
      expect(response).to be_redirect
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should respond success' do
        get :index, contest_id: contest
        expect(response).to be_redirect
      end

    end

    describe 'when contestant logged in and attended the contest' do

      include_examples 'login contestant'

      before do
        contestant.attend(contest)
      end

      it 'should respond success' do
        get :index, contest_id: contest
        expect(response).to be_success
      end

    end

  end

  describe 'GET /:id/show' do

    it 'should respond 404' do
      get :show, contest_id: contest, id: problem
      expect(response).to be_redirect
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should respond success' do
        get :show, contest_id: contest, id: problem
        expect(response).to be_redirect
      end

    end

    describe 'when contestant logged in and attended the contest' do

      include_examples 'login contestant'

      before do
        contestant.attend(contest)
      end

      it 'should respond success' do
        get :show, contest_id: contest, id: problem
        expect(response).to be_success
      end

    end

  end

end
