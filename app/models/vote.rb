class Vote < ActiveRecord::Base

  serialize :breakdown
  serialize :voter_ids
  serialize :voters

  attr_accessible :question, :required, :result, :roll_id, :vote_type, :breakdown, :voter_ids, :voters, :bill_id

  belongs_to :bill
  has_and_belongs_to_many :legislators

  validates :roll_id, :presence => true, :uniqueness => true

  # July, 1 2012 estimates from Census used in calculation.  Percent population out of population of 50 states, not including DC or US Territories.
  STATE_VOTE_STATS = {
    "AK" => {pop: 731449, percent: 0.23, one_per_fraction: 1},
    "AL" => {pop: 4822023, percent: 1.54, one_per_fraction: 2},
    "AR" => {pop: 2949131, percent: 0.94, one_per_fraction: 1},
    "AZ" => {pop: 6553255, percent: 2.09, one_per_fraction: 2},
    "CA" => {pop: 38041430, percent: 12.14, one_per_fraction: 9},
    "CO" => {pop: 5187582, percent: 1.66, one_per_fraction: 2},
    "CT" => {pop: 3590347, percent: 1.15, one_per_fraction: 1},
    "DE" => {pop: 917092, percent: 0.29, one_per_fraction: 1},
    "FL" => {pop: 19317568, percent: 6.17, one_per_fraction: 5},
    "GA" => {pop: 9919945, percent: 3.17, one_per_fraction: 3},
    "HI" => {pop: 1392313, percent: 0.44, one_per_fraction: 1},
    "IA" => {pop: 3074186, percent: 1.00, one_per_fraction: 1},
    "ID" => {pop: 1595728, percent: 0.51, one_per_fraction: 1},
    "IL" => {pop: 12875255, percent: 4.11, one_per_fraction: 3},
    "IN" => {pop: 6537334, percent: 2.09, one_per_fraction: 2},
    "KS" => {pop: 2885905, percent: 0.92, one_per_fraction: 1},
    "KY" => {pop: 4380415, percent: 1.40, one_per_fraction: 1},
    "LA" => {pop: 4601893, percent: 1.47, one_per_fraction: 1},
    "MA" => {pop: 6646144, percent: 2.12, one_per_fraction: 2},
    "MD" => {pop: 5884563, percent: 1.88, one_per_fraction: 2},
    "ME" => {pop: 1329192, percent: 0.42, one_per_fraction: 1},
    "MI" => {pop: 9883360, percent: 3.15, one_per_fraction: 3},
    "MO" => {pop: 6021988, percent: 1.92, one_per_fraction: 2},
    "MN" => {pop: 5379139, percent: 1.72, one_per_fraction: 2},
    "MS" => {pop: 2984926, percent: 0.95, one_per_fraction: 1},
    "MT" => {pop: 1005141, percent: 0.32, one_per_fraction: 1},
    "NC" => {pop: 9752073, percent: 3.11, one_per_fraction: 3},
    "ND" => {pop: 699628, percent: 0.22, one_per_fraction: 1},
    "NE" => {pop: 1855525, percent: 0.59, one_per_fraction: 1},
    "NH" => {pop: 1320718, percent: 0.42, one_per_fraction: 1},
    "NJ" => {pop: 8864590, percent: 2.83, one_per_fraction: 3},
    "NM" => {pop: 2085538, percent: 0.67, one_per_fraction: 1},
    "NV" => {pop: 2758931, percent: 0.88, one_per_fraction: 1},
    "NY" => {pop: 19570261, percent: 6.25, one_per_fraction: 5},
    "OH" => {pop: 11544225, percent: 3.68, one_per_fraction: 3},
    "OK" => {pop: 3814820, percent: 1.22, one_per_fraction: 1},
    "OR" => {pop: 3899353, percent: 1.24, one_per_fraction: 1},
    "PA" => {pop: 12763536, percent: 4.07, one_per_fraction: 3},
    "RI" => {pop: 1050292, percent: 0.34, one_per_fraction: 1},
    "SC" => {pop: 4723723, percent: 1.51, one_per_fraction: 2},
    "SD" => {pop: 833354, percent: 0.27, one_per_fraction: 1},
    "TN" => {pop: 6456243, percent: 2.06, one_per_fraction: 2},
    "TX" => {pop: 26059203, percent: 8.32, one_per_fraction: 7},
    "UT" => {pop: 2855287, percent: 0.91, one_per_fraction: 1},
    "VA" => {pop: 8185867, percent: 2.61, one_per_fraction: 3},
    "VT" => {pop: 626011, percent: 0.20, one_per_fraction: 1},
    "WA" => {pop: 6897012, percent: 2.20, one_per_fraction: 2},
    "WI" => {pop: 5726398, percent: 1.83, one_per_fraction: 2},
    "WV" => {pop: 1855413, percent: 0.59, one_per_fraction: 1},
    "WY" => {pop: 576412, percent: 0.18, one_per_fraction: 1} 
  }



  def self.pop_weighted voters
    pop_weighted_votes = []
    tally = {"Yea" => 0, "Nay" => 0, "Present" => 0, "Not Voting" => 0}
    voters.each_value do |v|
      pop_weight = STATE_VOTE_STATS[v["voter"]["state"]][:percent] / 2
      pop_weighted_votes << sprintf('%.2f', pop_weight)
      tally[v["vote"]] += weight  
    end
    tally.each do |vot, num|
      tally[vot] = sprintf('%.2f', num)
    end
    return pop_weighted_votes, tally
  end

end
