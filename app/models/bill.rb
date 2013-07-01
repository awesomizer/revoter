class Bill < ActiveRecord::Base
  attr_accessible :last_action, :last_vote_at, :nicknames, :official_title, :summary_short, :vote_list, :urls

  has_many :votes
end
