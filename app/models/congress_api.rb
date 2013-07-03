class CongressApi
  include HTTParty
  debug_output $stdout
  base_uri 'http://congress.api.sunlightfoundation.com'

  def initialize
  end

  def get_bill type, number, congress
    sun_bill_id = type + number + '-' + congress
    options = {query: 
               {apikey: ENV["SUNLIGHT_KEY"], 
                bill_id: sun_bill_id, 
                fields: 'bill_id,last_vote_at,official_title,nicknames,summary_short,votes,urls,last_action'}}
      self.class.get('/bills', options).parsed_response
  end

  def get_vote roll_id
    options = {query: 
               {apikey: ENV["SUNLIGHT_KEY"], 
                roll_id: roll_id, 
                fields: 'roll_id,vote_type,question,required,breakdown,voter_ids,voters,result'}}
      self.class.get('/votes', options).parsed_response
  end

  def get_legislator bioguide_id
    options = {query: 
               {apikey: ENV["SUNLIGHT_KEY"], 
                bioguide_id: bioguide_id, 
                fields: 'bioguide_id,state,title,chamber,state_rank,term_start,term_end,first_name,nickname,last_name'}}
      self.class.get('/legislators', options).parsed_response
  end

  def roll_call voter_ids
    # list of voters with vote and individual info
  end
end


