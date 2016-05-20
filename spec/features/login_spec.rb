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

  it 'should not login with invalid user name' do
    visit root_path
    fill_in 'uid', :with => 'foo'
    fill_in 'password', :with => 'password'
    click_on 'login'
    page.should_not have_content 'Logout'
  end

  it 'should not login with invalid password' do
    visit root_path
    fill_in 'uid', :with => 'user'
    fill_in 'password', :with => 'aaaaaaaaaa'
    click_on 'login'
    page.should_not have_content 'Logout'
  end
end
