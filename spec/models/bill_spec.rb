require 'spec_helper'

describe Bill do
  it {should have_many(:votes)}
  it {should validate_presence_of(:sun_bill_id)}

  it 'should find existing bills given an array of roll_ids' do
    bill = FactoryGirl.create(:bill)
    gotten_bill = Bill.get_bills(['s744-113'])
    expect(gotten_bill[0].official_title).to eq('Best Bill')
  end

  # this is returning true for new_bill.  not sure how to structure this, since it's supposed to be creating a new bill when one doesn't exist.  
  pending 'should create a bill if no bill already exists' do
    bill = FactoryGirl.create(:bill)
    new_bill = Bill.get_bills(['s1243-113'])
    expect(new_bill[0].id).to be > 0
  end

end
