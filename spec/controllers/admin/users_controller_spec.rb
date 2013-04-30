require 'spec_helper'

describe Admin::UsersController do

  let(:user) { create(:contestant) }

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

      before do
        get :index
      end

      it 'should respond success' do
        expect(response).to be_success
      end

      it 'should show all users' do
        users = assigns[:users]
        expect(users).not_to be_nil
        # TODO
        # check the size of users
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

  describe 'GET /show/:id' do

    it 'should not respond success' do
      get :show, id: user
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
        get :show, id: user
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :show, id: user
        expect(response).to be_success
      end

    end

  end

  describe 'GET /edit/:id' do

    it 'should not respond success' do
      get :edit, id: user
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
        get :edit, id: user
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :edit, id: user
        expect(response).to be_success
      end

    end

  end

end
