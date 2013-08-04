class State < ActiveRecord::Base
  
  attr_accessible :code, :name, :population, :pop_percent, :one_vote_weight

  has_many :legislators

  validate :code, :presence => true, :uniqueness => true
  validates_presence_of :name, :population

end
