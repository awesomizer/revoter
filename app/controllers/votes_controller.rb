class VotesController < ApplicationController

  def show
    @vote = Vote.find(params[:id])
    @pop_votes, @pop_tally = Vote.fractional_vote(@vote.voters, :percent, @vote.required)
    @one_per_frac_votes, @one_per_frac_tally = Vote.fractional_vote(@vote.voters, :one_per, @vote.required)
    @one_per_int_votes, @one_per_int_tally = Vote.integer_vote(@vote.voters, :one_per, @vote.required)
    gon.pop_votes, gon.pop_tally = @pop_votes, @pop_tally
    gon.one_per_frac_votes, gon.one_per_frac_tally = @one_per_frac_votes, @one_per_frac_tally
    gon.one_per_int_votes, gon.one_per_int_tally = @one_per_int_votes, @one_per_int_tally
  end

end
