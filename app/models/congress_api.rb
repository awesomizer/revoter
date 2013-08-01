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
                fields: 'roll_id,bill,vote_type,question,required,breakdown,voter_ids,voters,result'}}
      self.class.get('/votes', options).parsed_response
  end

  def get_recent_votes chamber
    options = {query: 
               {apikey: ENV["SUNLIGHT_KEY"], 
                chamber: "#{chamber}",
                congress: '113',
                order: 'voted_at',
                fields: 'question,result,roll_id,bill'}}
      response = self.class.get('/votes', options).parsed_response
      short_list = []
      response["results"][0..14].each do |vote|
        if vote["bill"]
          short_list << vote
        end
      end
      short_list
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


