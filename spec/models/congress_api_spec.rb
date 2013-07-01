require 'debugger'
require 'spec_helper'

describe CongressApi do

  # Mock the api in these tests?

  it 'should retrieve bill information with valid bill info' do
      api = CongressApi.new 
      response = api.find_bill('hr', '3590', '111')
      expect(response.parsed_response["results"][0]["bill_id"]).to eq('hr3590-111')
  end

  it 'should display an error message with invalid bill info' do
      api = CongressApi.new 
      response = api.find_bill('hr', '3590', 'xxx')
      expect(response).to raise_error
  end
  
  it 'should retrieve vote information with valid roll_id' do
      api = CongressApi.new
      response = api.votes('s396-2009')
      expect(response.parsed_response["results"][0]["question"]).not_to eq(nil)
  end

  it 'should retrieve legislator information with a valid bioguide_id' do
      api = CongressApi.new
      response = api.legislators('B000944')
      expect(response.parsed_response["results"][0]["state"]).not_to eq(nil)
  end


end
