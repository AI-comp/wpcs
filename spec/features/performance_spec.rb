describe "the signup process", :type => :feature do
  it "login" do
    visit '/'
    fill_in 'uid', :with => 'user_1_1'
    fill_in 'password', :with => 'password'
    click_on 'login'
    page.should have_content 'Logout'
  end
end
