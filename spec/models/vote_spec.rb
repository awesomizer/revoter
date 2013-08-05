require 'spec_helper'

describe Vote do
  
  it {should belong_to(:bill)}
  it {should have_and_belong_to_many(:legislators)}
  it {should validate_presence_of(:roll_id)}
  it {should validate_uniqueness_of(:roll_id)}
  it {should validate_presence_of(:question)}
  it {should validate_presence_of(:required)}
  it {should validate_presence_of(:result)}
  it {should validate_presence_of(:breakdown)}
  it {should validate_presence_of(:voters)}

# same problem as vote controller, calling vote model methods in turn calls State.find_by_code, which I don't know how to mock.  
  pending 'should return vote roll for fractional votes' do
    vote = FactoryGirl.create(:vote)
    popular_vote, popular_tally = Vote.fractional_vote(vote.voters, :pop_percent, vote.required)
    expect popular_vote.length.to eq(100)
    expect popular_tally["Nay"].to exist
  end
end
