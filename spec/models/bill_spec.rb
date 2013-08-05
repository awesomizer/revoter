require 'spec_helper'

describe Bill do
  it {should have_many(:votes)}
  it {should validate_presence_of(:sun_bill_id)}
  it {should validate_uniqueness_of(:sun_bill_id)}
  it {should validate_presence_of(:official_title)}
  it {should validate_presence_of(:summary_short)}

  it 'should find existing bills given an array of roll_ids' do
    bill = FactoryGirl.create( :bill )
    gotten_bill = Bill.get_bills( ['s744-113'] )
    expect( gotten_bill[0].official_title ).to eq( 'Best Bill' )
  end

  # figure out how to test the ability of self.get_bills to pass a bill not in the database to self.create_bill

  pending 'should create a bill with a valid and initialized bill object and a sun_bill_id' do
    bill = FactoryGirl.create( :bill )
  end

end
