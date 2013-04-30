require 'spec_helper'

describe Admin::ImagesController do

  let(:image) { create(:image) }

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

  describe 'GET /show' do

    it 'should not respond success' do
      get :show, id: image
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
        get :show, id: image
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :show, id: image
        expect(response).to be_success
      end

    end

  end


  describe 'GET /edit' do

    it 'should not respond success' do
      get :edit, id: image
      expect(response).not_to be_success
    end

    describe 'when contestant logged in' do

      include_examples 'login contestant'

      it 'should not respond success' do
        get :edit, id: image
        expect(response).not_to be_success
      end

    end

    describe 'when admin logged in' do

      include_examples 'login admin'

      it 'should respond success' do
        get :edit, id: image
        expect(response).to be_success
      end

    end

  end
end
