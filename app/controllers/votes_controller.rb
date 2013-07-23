class VotesController < ApplicationController

  def show
    @vote = Vote.find(params[:id])
    @vote_types = ["Yea", "Nay", "Present", "Not Voting"]
    @popular_votes, @popular_tally = Vote.fractional_vote(@vote.voters, :pop_percent, @vote.required)
    @fractional_votes, @fractional_tally = Vote.fractional_vote(@vote.voters, :one_vote_weight, @vote.required)
    @seniority_votes, @seniority_tally = Vote.integer_vote(@vote.voters, :one_vote_weight, @vote.required)

    @vote.voters.each do |v| 
      Legislator.find_or_create_by_bioguide_id(v[1]["voter"]["bioguide_id"]) do |l|
        l.state_code =   v[1]["voter"]["state"]
        l.title =   v[1]["voter"]["title"]
        l.chamber = v[1]["voter"]["chamber"]
        l.state_rank = v[1]["voter"]["state_rank"]
        l.state_name = v[1]["voter"]["state_name"]
        l.first_name = v[1]["voter"]["first_name"]
        l.nickname =   v[1]["voter"]["nickname"]
        l.last_name =  v[1]["voter"]["last_name"]
        l.party =  v[1]["voter"]["party"]
        l.state_id = State.find_by_code(v[1]["voter"]["state"]).id
        l.votes << @vote
      end
    end
  end

end
