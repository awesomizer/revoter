module VotesHelper

  def vote_present? party, vote
    if @vote.voters.each_value.select { |v| v["voter"]["party"] == "#{party}" && v["vote"] == "#{vote}" }.length > 0
      return true
    else
      return false
    end
  end
    
end
