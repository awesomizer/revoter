class CongressApi
  include HTTParty
  base_uri 'http://congress.api.sunlightfoundation.com'

  def initialize
  end

  def get_bill sun_bill_id
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
                all_legislators: true,
                fields: 'bioguide_id,state,title,chamber,state_rank,term_start,term_end,first_name,nickname,last_name'}}
      self.class.get('/legislators', options).parsed_response
  end

end


