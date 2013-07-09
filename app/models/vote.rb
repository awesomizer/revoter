class Vote < ActiveRecord::Base

  serialize :breakdown
  serialize :voter_ids
  serialize :voters

  attr_accessible :question, :required, :result, :roll_id, :vote_type, :breakdown, :voter_ids, :voters, :bill_id

  belongs_to :bill
  has_and_belongs_to_many :legislators
end
