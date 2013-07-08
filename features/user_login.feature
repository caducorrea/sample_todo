Feature: User Login

	Background:
		Given I am not authenticated

	Scenario: User successfully login
		Given I am a new user
		Then I go to login page
		And I fill in "user_email" with "test@email.com"
		And I fill in "user_password" with "secret_pass"
		And I press "Sign in"
		Then I should see "Signed in successfully."
		
	Scenario: User try to login with wrong email and password
		Then I go to login page
		And I fill in "user_email" with "test@email.com"
		And I fill in "user_password" with "wrong_secret"
		And I press "Sign in"
		Then I should see "Invalid email or password."
		