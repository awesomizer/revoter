class VotesController < ApplicationController

  def show
    @vote = Vote.find(params[:id])
    @pop_votes, @pop_tally = Vote.pop_weighted(@vote.voters)
  end

end
