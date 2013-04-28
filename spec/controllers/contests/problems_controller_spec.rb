require 'spec_helper'

describe Contests::ProblemsController do

  # TODO
  # check time
  let(:contest) { create(:wupc) }
  let(:problem) { contest.problems[0] }

  describe 'GET /index' do

    it 'should not respond success' do
      expect {
        get :index, contest_id: contest
      }.to raise_error
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should respond success' do
        get :index, contest_id: contest
        expect(response).to be_success
      end

    end

  end

  describe 'GET /:id/show' do

    it 'should not respond success' do
      expect {
        get :show, contest_id: contest, id: problem
      }.to raise_error
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should respond success' do
        get :show, contest_id: contest, id: problem
        expect(response).to be_success
      end

    end

  end


end
