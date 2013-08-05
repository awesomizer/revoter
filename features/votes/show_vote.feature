Feature: Display Vote Information
	In order to understand how undemocratic the Senate is
	As a political junkie
	I want to see different ways of weighting Senate votes

	Background: Site user
		Given I am a site user
		When I navigate to the vote page

	Scenario: Traditional vote weights
		Then I should see the traditional roll call

	Scenario: Popular vote weights
		When I click the Popular button
		Then I should see the popular roll call

	Scenario: 1+ Fractional vote weights
		When I click the 1+ Fractional button
		Then I should see the 1+ Fractional roll call

	Scenario: 1+ Senority vote weights
		When I click the 1+ Senority button
		Then I should see the 1+ Senority roll call
