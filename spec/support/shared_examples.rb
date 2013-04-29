shared_examples_for 'login contestant' do

  let(:contestant) { create(:contestant) }

  before do
    controller.login_user(contestant)
  end

  after do
    controller.logout_user
    contestant.destroy
  end

end

shared_examples_for 'login admin' do

  let(:admin) { create(:admin) }

  before do
    controller.login_user(admin)
  end

  after do
    controller.logout_user
    admin.destroy
  end

end
