require 'spec_helper'

describe AdminController do

  describe 'GET /index' do

    it 'should not respond success' do
      get :index
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should respond success' do
        get :index
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :index
        expect(response).to be_success
      end

    end

  end

end
