class Legislator < ActiveRecord::Base

  attr_accessible :bioguide_id,
    :state,
    :title,
    :chamber,
    :state_rank,
    :term_start,
    :term_end,
    :first_name,
    :nickname,
    :last_name

end
