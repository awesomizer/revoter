class CongressApi
  include HTTParty
  debug_output $stdout
  base_uri 'http://congress.api.sunlightfoundation.com'

  def initialize
  end

  def bill type, number, congress
    bill_id = type + number + '-' + congress
    options = {query: {apikey: ENV["SUNLIGHT_KEY"], bill_id: bill_id, fields: 'votes,history'}}
      self.class.get('/bills', options)
  end

  def votes roll_id
    options = {query: {apikey: ENV["SUNLIGHT_KEY"], roll_id: roll_id, fields: 'voter_ids,voters,required,result'}}
      self.class.get('/votes', options)
  end

  def legislators
  end

end


