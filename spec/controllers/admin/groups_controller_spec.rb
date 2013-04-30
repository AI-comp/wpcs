require 'spec_helper'

describe Admin::GroupsController do

  let(:group) { create(:group) }

  describe 'GET /index' do

    it 'should not respond success' do
      get :index
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
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

  describe 'GET /new' do

    it 'should not respond success' do
      get :new
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
        get :new
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :new
        expect(response).to be_success
      end

    end

  end

  describe 'GET /:id/show' do

    it 'should not respond success' do
      get :show, id: group
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
        get :show, id: group
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :show, id: group
        expect(response).to be_success
      end

    end

  end

  describe 'GET /:id/edit' do

    it 'should not respond success' do
      get :edit, id: group
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
        get :edit, id: group
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :edit, id: group
        expect(response).to be_success
      end

    end

  end

end
