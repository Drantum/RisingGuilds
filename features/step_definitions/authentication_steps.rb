def user(login="user")
  @user ||= Factory(:user, :login => login)
end

def login(username="user",password="password")
  user
  visit path_to("the homepage")
  response.should contain("Login")
  click_link "Login"
  fill_in "login", :with => username 
  fill_in "password", :with => password
  click_button "Login"
end

Given /^I am a registered user$/ do
  user
end

When /^I login$/ do
  login
end

Given /^I am logged in$/ do
  login
end

Given /^I'am logged out$/ do
  visit logout_path
end

When /^I login as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  unless username.blank?
    login(username,password)
  end
end

Then /^I should be on ([^\"]*)$/ do |page_name|
  response.request.path.should == path_to(page_name)
end

Then /^I should see my account$/ do
  response.should contain(@user.login)
end
