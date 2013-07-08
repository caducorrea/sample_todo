Feature: Remove a task

	Background:
		Given I am new and authenticated user
		When I go to tasks page
		And I follow "New Task"
		And I fill in "task_name" with "Test name"
		And I fill in "task_description" with "Lorem ipsun..."
		And I press "Create Task"
		
	Scenario: Remove a task
		When I go to tasks page
		And I follow image link with "remove"
		Then I should not see "Test name"
		