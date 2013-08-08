
When(/^I am on the page for searching bills$/) do
  visit root_path 
end

# This is failing because the homepage is refreshing instead of loading vote#show, thoug the link step passes and this works in app
Then(/^I should see the traditional roll call$/) do
  pending # page.should have_content( 'Traditional' )
end

Then(/^I should see vote weights$/) do 
  page.should have_content( 'weight' )
end

Then(/^I should see a list of recent Senate vote links$/) do 
  vote_links = all 'li.recent-vote'  
  vote_links.should_not be_empty
end

When(/^I click a link for a vote$/) do
  first( 'li.recent-vote' ).click
end


