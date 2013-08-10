class Bill < ActiveRecord::Base

  serialize :nicknames
  serialize :vote_list
  serialize :urls
  serialize :last_action

  attr_accessible :sun_bill_id, 
            :last_action, 
            :last_vote_at, 
            :nicknames, 
            :official_title, 
            :summary_short, 
            :vote_list, 
            :urls

  has_many :votes

  validates_uniqueness_of :sun_bill_id
  validates_presence_of :official_title, :summary_short, :sun_bill_id

  def self.get_bills sun_bill_id_array
    bill_list = []
    sun_bill_id_array.each do | id |
      bill = self.find_or_initialize_by_sun_bill_id( id )
      if bill.new_record?
        bill = self.create_bill( bill, id )
      end
      bill_list << bill
    end
    bill_list
  end

  def self.create_bill bill, sun_bill_id
    api = CongressApi.new
    results = api.get_bill( sun_bill_id )
    results = results[ "results" ][0]
    bill.official_title = results[ "official_title" ] 
    bill.nicknames = results[ "nickname" ] 
    bill.summary_short = results[ "summary_short" ] 
    bill.last_vote_at = results[ "last_vote_at" ] 
    bill.last_action = results[ "last_action" ] 
    bill.vote_list = results[ "votes" ]
    bill.urls = results[ "urls" ]
    bill.save
  end

end
