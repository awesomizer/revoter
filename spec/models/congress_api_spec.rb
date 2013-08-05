require 'spec_helper'

describe CongressApi do

  # Mock the api in these tests

  it 'retrieves bill information with valid bill info' do
      api = CongressApi.new 
      response = api.get_bill('s744-113')
      expect(response["results"][0]["bill_id"]).to eq('s744-113')
  end

  it 'displays an error message with invalid bill info' do
      api = CongressApi.new 
      response = api.get_bill('hr3590-xxx')
      expect(response).to raise_error
  end
  
  it 'retrieves vote information with valid roll_id' do
      api = CongressApi.new
      response = api.get_vote('s396-2009')
      expect(response["results"][0]["question"]).not_to eq(nil)
  end

  it 'retrieves legislator information with a valid bioguide_id' do
      api = CongressApi.new
      response = api.get_legislator('B000944')
      expect(response["results"][0]["state"]).not_to eq(nil)
  end

  it 'retrieves an array of recent votes' do
      api = CongressApi.new
      response = api.get_recent_votes( 'senate' )
      expect( response.length ).to be > 1
  end

end
