require 'spec_helper'

describe Legislator do

  it {should belong_to(:state)}
  it {should have_and_belong_to_many(:votes)}
  it {should validate_presence_of(:bioguide_id)}
  it {should validate_uniqueness_of(:bioguide_id)}
  it {should validate_presence_of(:state_code)}
  it {should validate_presence_of(:chamber)}
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:party)}

  context 'GET #create_or_update' do

# not sure how to configure this test. legislator is a congressapi object!?     
    pending 'should create legislators if they dont exist' do
      api_response = FactoryGirl.create(:api_get_legislator)
      legislator = Legislator.create_or_update(api_response)
      expect(legislator.bioguide_id).to eq("A111") 
    end

# Legislator.create_or_update is not updating even though updated_at is being set properly.    
    pending 'should update legislators if they havent been updated in more than a month' do
      leg = FactoryGirl.create(:legislator, updated_at: (Time.now - 6.weeks))
      legislator = Legislator.create_or_update(leg)
      expect(legislator.updated_at).to be < (Time.now - 1.weeks)
    end

    pending 'should not update legislators if they have been updated in less than a month' do
      leg = FactoryGirl.create(:legislator, updated_at: (Time.now - 2.weeks))
      legislator = Legislator.create_or_update(leg)
      expect(legislator.updated_at).to be > (Time.now - 1.weeks)
    end

  end
end
