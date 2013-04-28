require 'spec_helper'

describe ContestsController do

  describe 'GET /index' do

    it 'should respond failure' do
      get :index
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should respond success' do
        get :index
        expect(response).to be_success
      end
    end
  end

  describe 'GET /show/:wupc' do

    before do
      @contest =  build(:wupc)
      @contest.save!
    end

    after do
      @contest.destroy
    end

    it 'should respond failure' do
      get :show, id: @contest
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should respond success' do
        get :show, id: @contest
        expect(response).to be_success
      end

    end
    
  end

end
