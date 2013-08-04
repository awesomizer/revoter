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

  validates :bioguide_id, presence: true, uniqueness: true
  validates_presence_of :state_code, :chamber, :first_name, :last_name, :party
  
  def self.create_or_update voter
    l = Legislator.find_or_initialize_by_bioguide_id(voter["bioguide_id"])
    if l.id.nil? || l.updated_at > Time.current - 1.months
        l.state_code = voter["state"]
        l.title = voter["title"]
        l.chamber = voter["chamber"]
        l.state_rank = voter["state_rank"]
        l.state_name = voter["state_name"]
        l.first_name = voter["first_name"]
        l.nickname = voter["nickname"]
        l.last_name = voter["last_name"]
        l.party = voter["party"]
        if voter["state"]
          l.state_id = State.find_by_code(voter["state"]).id
        else
          l.state_id = State.find_by_code(voter["state_code"]).id
        end
        l.save
    end
    return l  
  end
end
