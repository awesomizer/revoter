class Vote < ActiveRecord::Base
  attr_accessible :question, :required, :result, :roll_id, :vote_type, :voter_ids, :bill_id

  belongs_to :bill
end
