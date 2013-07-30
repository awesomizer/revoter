require 'spec_helper'

describe BillsController do

  context 'GET #find' do

# rspec doesn't like the vote_list hash in the factory for some reason.  It spits an error that you can't mass-assign protected variables and lists the keys for the vote_list hash.    

    pending 'retrieves bill information and assign it @bill' do
      bill = FactoryGirl.create(:bill)
      get :find, {bill_type: "s", bill_number: "744", congress: "113"}
      assigns(:bill).should eq(bill)
    end

    pending 'retrieves an array of vote information and assign it to @votes' do
      bill = FactoryGirl.create(:bill)
      get :find, {bill_type: "s", bill_number: "744", congress: "113"}
      assigns(:votes).size.should == 1
    end

  end

  context 'GET #show' do
    
    it 'retrieves bill information and assigns it to @bill' do
      bill = FactoryGirl.create(:bill)
      get :show, {id: 5}
      assigns(:bill).should eq(bill)
    end

# The association in the bill factory seems to be wrong.  expectation is finding 0 votes assigned to @votes
    pending 'retrieves vote information and assigns it to @votes' do
      bill = FactoryGirl.create(:bill)
      get :show, {id: 5}
      assigns(:votes).size.should == 1
    end

  end

end

