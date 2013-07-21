class VotesController < ApplicationController

  def show
    @vote = Vote.find(params[:id])
    @pop_votes, @pop_tally = Vote.fractional_vote(@vote.voters, :percent, @vote.required)
    @one_per_frac_votes, @one_per_frac_tally = Vote.fractional_vote(@vote.voters, :one_per, @vote.required)
    @one_per_int_votes, @one_per_int_tally = Vote.integer_vote(@vote.voters, :one_per, @vote.required)
    
    gon.pop_votes, gon.pop_tally = @pop_votes, @pop_tally
    gon.one_per_frac_votes, gon.one_per_frac_tally = @one_per_frac_votes, @one_per_frac_tally
    gon.one_per_int_votes, gon.one_per_int_tally = @one_per_int_votes, @one_per_int_tally

    roll_call = []
    @vote.voters.each_value do |v|
      voter = { last_name: v["voter"]["last_name"], first_name: v["voter"]["first_name"], state_name: v["voter"]["state_name"], state_rank: v["voter"]["state_rank"], party: v["voter"]["party"], vote: v["vote"] } 
      roll_call << voter
    end
    gon.voters = roll_call
  end

end
