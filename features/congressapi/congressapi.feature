Feature: Display historical data about US congressional legislation

	Scenario: get bill information with valid id
		Given that I enter a valid bill number, chamber and congress number
		When I click the find-a-bill button
		Then The bill information should be displayed on the screen
		Then A list of all votes for that bill should be on the screen

	Scenario: get bill information with invalid id
		Given that I enter an invalid bill number, chamber or congress number
		When I click the find-a-bill button
		Then A 'bill not found' error message should be displayed on the screen

	Scenario: get vote informaion for a particular vote

	Scenario: get legislator information for a particular legislator
