class State < ActiveRecord::Base
  
  attr_accessible :code, :name, :population, :pop_percent, :one_vote_weight

  has_many :legislators

  validates_uniqueness_of :code
  validates_presence_of :code, :name, :population

end
