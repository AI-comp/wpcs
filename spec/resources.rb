
shared_examples_for 'respond success' do |action|
  describe 'GET /'+action.to_s do
    it 'should return 200 status code' do
      get action
      expect(response).to be_success
    end
  end
end
