require 'spec_helper'

describe Legislator do

  it {should have_and_belong_to_many(:legislators)}
  it {should validate_presence_of(:bioguide_id)}
  it {should validate_uniqueness_of(:bioguide_id)}

  context 'GET #create_or_update' do

    it 'should create legislators if they dont exist' do
      legislator = Legislator.create_or_update(:legislator, id: 2)
      expect legislator.id.to eq(2) 
    end

    it 'should update legislators if they havent been updated in more than a month' do
      legislator = Legislator.create_or_update(:legislator, updated_at: Time.weeks_ago(6))
      expect legislator.updated_at.to < Time.weeks_ago(1)
    end

    it 'should not update legislators if they have been updated in less than a month' do
      legislator = Legislator.create_or_update(:legislator, updated_at: Time.weeks_ago(2))
      expect legislator.updated_at.to > Time.weeks_ago(1)
    end

  end
end
