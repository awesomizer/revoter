require 'spec_helper'

describe Bill do
  it {should have_many(:votes)}
  it {should validate_presence_of(:sun_bill_id)}

  it 'should find existing bills given an array of roll_ids' do
    bill = Bill.get_bills('s744-113')
    expect bill.official_title.to eq('Best Bill')
  end

  it 'should create a bill if no bill already exists' do
    bill = Bill.get_bills('s1243-113')
    expect bill.sun_bill_id.to eq('s1243-113')
  end

end
