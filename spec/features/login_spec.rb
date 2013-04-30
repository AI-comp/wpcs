describe "the signup process", :type => :feature do
  before :each do
    visit '/users/register'
    fill_in 'user_uid', :with => 'user'
    fill_in 'password', :with => 'password'
    click_on 'Create User'
    click_on 'Logout'
  end

  it "login" do
    visit '/'
    fill_in 'uid', :with => 'user'
    fill_in 'password', :with => 'password'
    click_on 'login'
    page.should have_content 'Logout'
  end
end
