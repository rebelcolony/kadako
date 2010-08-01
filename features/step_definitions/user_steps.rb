When /^I signup$/ do
  visit new_user_path
  fill_in "user_email", :with => "kevin@rebelcolony.com"
  fill_in "user_password", :with => "123456"
  fill_in "user_password_confirmation", :with => "123456"
  click_button "user_submit"
end

Given /^a valid user$/ do
@user = User.create!({
          :email => "kevin@rebelcolony.com",
          :password => "123456",
          :password_confirmation => "123456"
})
end

Given /^I am logged in$/ do
  Given "a valid user"
  visit login_url
  fill_in "user_session_email", :with => "kevin@rebelcolony.com"
  fill_in "user_session_password", :with => "123456"
  click_button "user_session_submit"
end
