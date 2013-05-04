describe 'invalid request', :type => :feature do
  describe 'when meaningless URL' do
    it 'should respond 404' do
      visit '/hogefuga'
      expect(page.status_code).to be(404)
    end
  end

  describe 'when guest access to admin page' do
    it 'should respond 404' do
      visit '/admin'
      expect(page.status_code).to be(404)
    end
  end
end
