require 'spec_helper'

describe GroupsController do

  let(:group) { create(:group) }

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

  describe 'GET /new' do

    it 'should respond failure' do
      get :new
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should respond success' do
        get :new
        expect(response).to be_success
      end

    end

  end

  describe 'GET /:id/show' do

    it 'should respond failure' do
      get :show, id: group
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should respond success' do
        get :show, id: group
        expect(response).to be_success
      end

    end

  end

end
