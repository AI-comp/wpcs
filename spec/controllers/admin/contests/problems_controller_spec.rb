require 'spec_helper'

describe Admin::Contests::ProblemsController do

  let(:contest) { create(:contest) }
  let(:problem) { contest.problems[0] }

  describe 'GET /index' do

    it 'should not respond success' do
      get :index, contest_id: contest
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
        get :index, contest_id: contest
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :index, contest_id: contest
        expect(response).to be_success
      end

    end

  end

  describe 'GET /new' do

    it 'should not respond success' do
      get :new, contest_id: contest
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
        get :new, contest_id: contest
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :new, contest_id: contest
        expect(response).to be_success
      end

    end

  end

  describe 'GET /show/:id' do

    it 'should not respond success' do
      get :show, contest_id: contest, id: problem
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
        get :show, contest_id: contest, id: problem
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :show, contest_id: contest, id: problem
        expect(response).to be_success
      end

    end

  end

  describe 'GET /edit/:id' do

    it 'should not respond success' do
      get :edit, contest_id: contest, id: problem
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
        get :edit, contest_id: contest, id: problem
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :edit, contest_id: contest, id: problem
        expect(response).to be_success
      end

    end

  end

end
