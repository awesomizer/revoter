module VotesHelper

  def vote_present? party, vote
    if @vote.voters.each_value.select { |v| v["voter"]["party"] == "#{party}" && v["vote"] == "#{vote}" }.length > 0
      return true
    else
      return false
    end
  end
    
  def get_legislator voter
    @vote.legislators.find_by_bioguide_id(voter["bioguide_id"])
  end

#  def vote_weight legislator
    
  def roll_call_list party, position, *roll
    list = []
    @vote.voters.each_value do |v|
      if v["voter"]["party"] == party && v["vote"] == position
        legislator = get_legislator(v["voter"])
        item = roll_call_item(legislator, roll)
        list << item
      end
    end
    list
  end

  def roll_call_item legislator, *roll
    case roll[0][0]
    when 'traditional'
      "#{legislator.last_name}, #{legislator.first_name}, #{legislator.state_name} / #{legislator.state_rank} trad"
    when 'popular'
      "#{legislator.last_name}, #{legislator.first_name}, #{legislator.state_name} / #{legislator.state_rank} pop"
    when 'fractional'
      "#{legislator.last_name}, #{legislator.first_name}, #{legislator.state_name} / #{legislator.state_rank} frac"
    when 'seniority'
      "#{legislator.last_name}, #{legislator.first_name}, #{legislator.state_name} / #{legislator.state_rank} sen"
    else
      "#{legislator.last_name}, #{legislator.first_name}, #{legislator.state_name} / #{legislator.state_rank} else"
    end
  end

end
