class Bill < ActiveRecord::Base

  serialize :nicknames
  serialize :vote_list
  serialize :urls

  attr_accessible :sun_bill_id, :last_action, :last_vote_at, :nicknames, :official_title, :summary_short, :vote_list, :urls

  has_many :votes

  validates_presence_of :sun_bill_id, :uniqueness => :true
end
