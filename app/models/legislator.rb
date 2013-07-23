class Legislator < ActiveRecord::Base

  attr_accessible :bioguide_id,
    :state_code,
    :title,
    :chamber,
    :state_rank,
    :state_name,
    :term_start, # term_start and term_end are not part of the voter record that is being used to create legislators
    :term_end,
    :first_name,
    :nickname,
    :last_name,
    :party,
    :state_id

  belongs_to :state
  has_and_belongs_to_many :votes

end
