Feature: Show Bill Information
	In order to understand the subject of a bill
	As an engaged citizen
	I want to see the basic information about bills

	Scenario: Bill info
		Given I am a site user
		When I navigate to the bill view page for a specific bill
		Then I should see title of the bill
		And I should see a description of the bill
