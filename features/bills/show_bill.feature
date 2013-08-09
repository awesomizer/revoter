# This passes when run alone and fails when run with the other bill scenarios.  Need to figure out the conflict.

Feature: Show Bill Information
	In order to understand the subject of a bill
	As an engaged citizen
	I want to see the basic information about bills

	Background: Bill search page
		Given I am a site user
		And There is a bill in the database
	
		Scenario: Bill info
			When I navigate to the bill view page
			Then The bill's information should be displayed on the screen
			And I should see a description of the bill
