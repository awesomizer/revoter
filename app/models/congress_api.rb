class CongressApi
  include HTTParty
  debug_output $stdout
  base_uri 'http://congress.api.sunlightfoundation.com'

  def initialize
  end

  def bill type, number, congress
    bill_id = type + number + '-' + congress
    options = {query: {apikey: ENV["SUNLIGHT_KEY"], bill_id: bill_id, fields: 'last_vote_at,titles,nicknames,summary_short,urls,votes,history,last_action'}}
      self.class.get('/bills', options)
  end

  def votes roll_id
    options = {query: {apikey: ENV["SUNLIGHT_KEY"], roll_id: roll_id, fields: 'vote_type,question,required,voter_ids,voters,result'}}
      self.class.get('/votes', options)
  end

  def legislators bioguide_id
    options = {query: {apikey: ENV["SUNLIGHT_KEY"], bioguide_id: bioguide_id, fields: 'state,title,chamber,state_rank,term_start,term_end,first_name,nickname,last_name'}}
      self.class.get('/legislators', options)
  end

end


