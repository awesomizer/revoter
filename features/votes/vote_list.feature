Feature: A list of links to recent Senate votes
	In order to identify votes to examine
	As a politically active person
	I want a list of recent votes taken by the Senate
	
	Scenario: get vote information from a list of votes for a bill
		Given A list of votes for a bill is displayed
		When I click a vote for the bill
		Then The vote's information should be displayed on the screen
	
	Scenario: get vote informaion from a list of recent votes
		Given A list of votes for a bill is displayed
		When I click a vote for the bill
		Then The vote's information should be displayed on the screen
