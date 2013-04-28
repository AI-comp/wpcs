shared_examples_for 'login contestant' do

  let(:user) { create(:alice) }

  before do
    controller.login_user(user)
  end

  after do
    controller.logout_user
    user.destroy
  end

end
