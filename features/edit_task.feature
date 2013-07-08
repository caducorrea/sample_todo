Feature: Edit a task

	Background:
		Given I am new and authenticated user
		When I go to tasks page
		And I follow "New Task"
		And I fill in "task_name" with "Test name"
		And I fill in "task_description" with "Lorem ipsun..."
		And I press "Create Task"
		
	Scenario: Remove a task
		When I go to tasks page
		And I follow image link with "edit"
		And I fill in "task_name" with "Another test name"
		And I press "Update Task"
		Then I should see "Another test name"