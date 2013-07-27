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
  
  def self.create_or_update legislator
    l = Legislator.find_or_initialize_by_bioguide_id(legislator["bioguide_id"])
    if l.id.nil? || l.updated_at > Time.current - 1.months
        l.state_code = legislator["state"]
        l.title = legislator["title"]
        l.chamber = legislator["chamber"]
        l.state_rank = legislator["state_rank"]
        l.state_name = legislator["state_name"]
        l.first_name = legislator["first_name"]
        l.nickname = legislator["nickname"]
        l.last_name = legislator["last_name"]
        l.party = legislator["party"]
        l.state_id = State.find_by_code(legislator["state"]).id
        l.save
    end
    return l  
  end
end
