Feature: Obtain Senate legislation
	In order to undertand my democracy
	As an active citizen
	I want to find bills of interest

	Scenario: get bill information with valid inputs
		Given a valid bill number and congress number entered in the form
		When I click the form submit button
		Then The bill's information should be displayed on the screen

	Scenario: generate an error when you submit invalid inputs
		Given an invalid bill number and congress number combination entered in the form
		When I click the form submit button
		Then A 'feed me numbers' error message should be displayed on the screen

	Scenario: generate an error when you don't submit bill number
		Given an invalid bill number and congress number combination entered in the form
		When I click the form submit button
		Then A 'I'm hungry' error message should be displayed on the screen

	Scenario: generate an error when you submit bill information that doesn't match any bill
		Given an valid bill number and congress number combination entered in the form, but no actual bill corresponding
		When I click the form submit button
		Then A 'no luck finding it' error message should be displayed on the screen

