class CongressApi
  include HTTParty
  base_uri 'http://congress.api.sunlightfoundation.com'

  def initialize
  end

  def bill type, number, congress
    id = type + number + '-' + congress
    options = {:bill_id => id}
      self.class.get('/bills', options)
  end

  def votes
  end

  def legislators
  end

end


