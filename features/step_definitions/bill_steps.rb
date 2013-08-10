Given(/^I am a site user$/) do
  visit root_path
end

Given(/^I am on the bill search page$/) do
  visit root_path
end

Given(/^There is a bill in the database$/) do
  if @bill then @bill.delete end
  @bill = FactoryGirl.create( :bill )
end

# This is testing with a bill in db, also need one for creating a new bill
Given(/^a valid bill number and congress number entered in the form$/) do
  fill_in 'bill_number', with: '744'
end

When(/^I click the form submit button$/) do
  click_button 'submit-button'
end

Then(/^The bill's information should be displayed on the screen$/) do
  page.should have_content( 'Best Bill' )
end

Given(/^a blank bill number in the form$/) do
  fill_in 'bill_number', with: ''
end

Given(/^an invalid bill number and congress number combination entered in the form$/) do
  fill_in 'bill_number', with: 'number' 
end

Then(/^I should see title of the bill$/) do
  page.should have_content( 'Best Bill' )
end

Then(/^I should see a description of the bill$/) do
  page.should have_content( 'Awesomeness, thanks.' )
end

Then(/^A 'feed me numbers' error message should be displayed on the screen$/) do
  find_field( 'please feed me numbers :-)' ).value.should == ''
end

Then(/^A 'I'm hungry' error message should be displayed on the screen$/) do
  find_field( 'I\'m hungry :-)' ).value.should == ''
end

Given(/^an valid bill number and congress number combination entered in the form, but no actual bill corresponding$/) do
  fill_in 'bill_number', with: '99999'
end

Then(/^A 'no luck finding it' error message should be displayed on the screen$/) do
  find_field( "drats! no luck finding it :-/" ).value.should == ''
end

When(/^I navigate to the bill view page$/) do
  visit bill_path(@bill)
end

Then(/^I should see basic information re the bill$/) do
  page.should have_content( 'Votes' )
end

