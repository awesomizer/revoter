require 'spec_helper'

describe Legislator do

  before(:all) do
    @voter = {"bioguide_id"=>"A000360", "birthday"=>"1940-07-03", "chamber"=>"senate", "contact_form"=>"http://www.alexander.senate.gov/public/index.cfm?p=Email", "crp_id"=>"N00009888", "district"=>nil, "facebook_id"=>"89927603836", "fax"=>"202-228-3398", "fec_ids"=>["S2TN00058", "P60003225"], "first_name"=>"Lamar", "gender"=>"M", "govtrack_id"=>"300002", "icpsr_id"=>40304, "in_office"=>true, "last_name"=>"Alexander", "lis_id"=>"S289", "middle_name"=>nil, "name_suffix"=>nil, "nickname"=>nil, "office"=>"455 Dirksen Senate Office Building", "party"=>"R", "phone"=>"202-224-4944", "senate_class"=>2, "state"=>"TN", "state_name"=>"Tennessee", "state_rank"=>"senior", "term_end"=>"2015-01-03", "term_start"=>"2009-01-06", "thomas_id"=>1695.0, "title"=>"Sen", "twitter_id"=>"senalexander", "votesmart_id"=>15691, "website"=>"http://www.alexander.senate.gov", "youtube_id"=>"lamaralexander"}
  end
  
  # This throws an error for validation 'Code has already been taken' 
  # when just this spec is run alone, fine with whole suite.
  before(:each) do 
    @state = FactoryGirl.create( :state )
    State.stub( :find_by_code ).and_return( @state )
  end
 
  after(:each) do 
    @state.delete
  end
  
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

    it 'should create legislators if they dont exist' do
      legislator = Legislator.create_or_update( @voter )
      expect( legislator.bioguide_id ).to eq( "A000360" ) 
    end

    # This was being broken by the factory girl association to state in the legislator factory. It's removed now.
    it 'should update legislators if they havent been updated in more than a month' do
      leg = FactoryGirl.create(:legislator, updated_at: 6.weeks.ago)
      legislator = Legislator.create_or_update(leg)
      expect(legislator.updated_at).to be < 1.week.ago
    end
    
    it 'should not update legislators if they have been updated in less than a month' do
      leg = FactoryGirl.create( :legislator, updated_at: 2.weeks.ago )
      legislator = Legislator.create_or_update( leg )
      expect( legislator.updated_at ).to be < 1.week.ago
    end

  end
end
