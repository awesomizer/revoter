require 'spec_helper'

describe BillsController do

  context 'GET #find' do

    it 'retrieves bill information and assign it @bill' do
      bill = FactoryGirl.create(:bill)
      get :find, {bill_type: "s", bill_number: "744", congress: "113"}
      assigns(:bill).should eq(bill)
    end

#    it 'retrieves an array of vote information and assign it to an instance variable' do
      #vote1 = FactoryGirl.create(:vote)
      #vote2 = FactoryGirl.create(:vote)
      #get :bill, {bill_type: "hr", bill_number: "3590", congress: "111"}
      #assigns(:votes).size.should > 1
    #end

  end
end

