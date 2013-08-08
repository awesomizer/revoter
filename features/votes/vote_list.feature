Feature: Links to recent Senate votes
	In order to identify votes to examine
	As a politically active person
	I want a list of recent votes taken by the Senate

	Scenario: get vote recent votes list
		When I am on the page for searching bills
		Then I should see a list of recent Senate vote links

	Scenario: follow link to vote page
		Given  I am on the page for searching bills
		When I click a link for a vote
		Then I should see the traditional roll call
			
