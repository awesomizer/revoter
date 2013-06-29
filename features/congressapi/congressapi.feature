Feature: Obtain Vote Information

	Scenario: Valid bill information
		Given that I enter valid bill number, chamber and congress number
		When I click the submit button
		Then The bill information should be displayed on the screen
		Then A list of all votes for that bill should be on the screen

	Scenario: Invalid bill information
		Given that I enter invalid bill number, chamber or congress number
		When I click the submit button
		Then A 'bill not found' error message should be displayed on the screen

		
