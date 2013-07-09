class Legislator < ActiveRecord::Base

  attr_accessible :bioguide_id,
    :state,
    :title,
    :chamber,
    :state_rank,
    :state_name,
    :term_start,
    :term_end,
    :first_name,
    :nickname,
    :last_name

  has_and_belongs_to_many :votes

end
