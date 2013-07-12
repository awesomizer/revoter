class VotesController < ApplicationController

  def show
    @vote = Vote.find(params[:id])
    @pop_votes, @pop_tally = Vote.fractional_vote(@vote.voters, :percent)
    @one_per_frac_votes, @one_per_frac_tally = Vote.fractional_vote(@vote.voters, :one_per)
    @one_per_int_votes, @one_per_int_tally = Vote.integer_vote(@vote.voters, :one_per)
  end

end
