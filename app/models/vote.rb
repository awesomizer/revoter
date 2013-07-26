class Vote < ActiveRecord::Base

  serialize :breakdown
  serialize :voters

  attr_accessible :question, :required, :result, :roll_id, :vote_type, :breakdown, :voters, :bill_id

  belongs_to :bill
  has_and_belongs_to_many :legislators

  validates :roll_id, :presence => true, :uniqueness => true

  def self.vote_positions
    ["Yea", "Nay", "Present", "Not Voting"] 
  end

  def self.fractional_vote voters, system, required
    votes = {}
    tally = {"Result" => "", "Yea" => 0.0, "Nay" => 0.0, "Present" => 0.0, "Not Voting" => 0.0}
    voters.each_value do |v|
      state = State.find_by_code(v["voter"]["state"])
      weight = state.send(system.to_sym) / 2 
      pretty_weight = sprintf('%.2f', weight)
      voter = v["voter"]["bioguide_id"]
      votes.merge!({voter => pretty_weight})
      tally[v["vote"]] += weight 
    end

    tally.each do |t, n|
      if tally[t].is_a? Float
        tally[t] = sprintf('%.2f', n)
        tally[t].gsub!(/^0+/, "")
        tally[t].gsub!(/0$/, "")
      end
    end
    
    tally = vote_result(tally, required)
    return votes, tally
  end

  def self.integer_vote voters, system, required
    votes = {}
    tally = {"Result" => "", "Yea" => 0, "Nay" => 0, "Present" => 0, "Not Voting" => 0}
    voters.each_value do |v|
      state = State.find_by_code(v["voter"]["state"])
      vote = state.send(system.to_sym).to_i
      weight = int_weight_calculator(vote, v)
      voter = v["voter"]["bioguide_id"]
      votes.merge!({voter => weight})
      tally[v["vote"]] += weight 
    end

    tally = vote_result(tally, required)
    return votes, tally
  end

  def self.int_weight_calculator vote, v
    if vote == 1
      vote = single_vote(v["voter"]["state_rank"], vote)
    elsif vote % 2 == 0
      vote = vote / 2
    else vote % 2 == 1
      vote = odd_vote(v["voter"]["state_rank"], vote)
    end
  end

  def self.single_vote rank, vote
    if rank == "senior"
      vote = 1
    else
      vote = 0
    end
  end

  def self.odd_vote rank, vote
    if rank == "senior"
      vote = (vote + 1) / 2
    else
      vote = (vote - 1) / 2
    end
  end

  def self.vote_result tally, required
    if required == "1/2"
      tally["Yea"].to_f > 50 ? tally["Result"] = "Passed" : tally["Result"] = "Rejected"
    elsif required == "3/5"
      tally["Yea"].to_f >= 60 ? tally["Result"] = "Passed" : tally["Result"] = "Rejected"
    end
    tally
  end

end
