Feature: List Tasks

	Background:
		Given I am new and authenticated user
		When I go to tasks page
		
	Scenario: Show a empty list to tasks
		Then I should see "New Task"
		And I should see "You have no tasks created"
		
	Scenario: Show a list with two tasks
		And I follow "New Task"
		And I fill in "task_name" with "Test name"
		And I fill in "task_description" with "Lorem ipsun..."
		And I press "Create Task"
		And I follow "New Task"
		And I fill in "task_name" with "Another test name"
		And I fill in "task_description" with "Another lorem ipsun..."
		And I press "Create Task"
		Then I should see "Test name"
		And I should see "Another test name"
		
		