Given(/^I am a new user$/) do
  email = 'test@email.com'
  password = 'secret_pass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!  
end

Given(/^I am new and authenticated user$/) do
  email = 'test@email.com'
  password = 'secret_pass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!  

  visit '/users/sign_in'
  fill_in "user_email", :with => "test@email.com"
  fill_in "user_password", :with => 'secret_pass'
  click_button "Sign in"
end

Given(/^I am not authenticated$/) do
  visit "/users/sign_out"
end

Then(/^I go to login page$/) do
  visit "/users/sign_in"
end