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

  def short_result
    case @vote.result
    when /rejected/i
      return 'Rejected'
    when /passed/i
      return 'Passed'
    when /agreed/i
      return 'Passed'
    else
      return 'Error'
    end
  end

  def roll_call_list party, position, *roll
    list = []
    @vote.voters.each_value do |v|
      if v["voter"]["party"] == party && v["vote"] == position
        legislator = get_legislator(v["voter"])
        item = []
        item = roll_call_item(legislator, roll)
        list << item
      end
    end
    list
  end

  def roll_call_item legislator, *roll
    case roll[0][0]
    when 'traditional'
      ["#{legislator.last_name}, #{legislator.first_name} - #{legislator.state_name}", 1]
    when 'popular'
      ["#{legislator.last_name}, #{legislator.first_name} - #{legislator.state_name}", @popular_votes[legislator.bioguide_id]]
    when 'fractional'
      ["#{legislator.last_name}, #{legislator.first_name} - #{legislator.state_name}", @fractional_votes[legislator.bioguide_id]]
    when 'seniority'
      ["#{legislator.last_name}, #{legislator.first_name} - #{legislator.state_name}", @seniority_votes[legislator.bioguide_id]]
    else
      ["#{legislator.last_name}, #{legislator.first_name} - #{legislator.state_name}", 1]
    end
  end

end
