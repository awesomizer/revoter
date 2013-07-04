class Vote < ActiveRecord::Base
  attr_accessible :question, :required, :result, :roll_id, :vote_type, :breakdown, :voter_ids, :bill_id, :roll_call

  belongs_to :bill
  has_and_belongs_to_many :legislators
end
