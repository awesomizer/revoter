class State < ActiveRecord::Base
  
  attr_accessible :code, :name, :population, :pop_percent, :one_vote_weight

  has_many :legislators

end
