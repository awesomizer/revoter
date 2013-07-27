class VotesController < ApplicationController

  def show
    @vote = Vote.find(params[:id])
    @vote_types = Vote.vote_positions
    @popular_votes, @popular_tally = Vote.fractional_vote(@vote.voters, :pop_percent, @vote.required)
    @fractional_votes, @fractional_tally = Vote.fractional_vote(@vote.voters, :one_vote_weight, @vote.required)
    @seniority_votes, @seniority_tally = Vote.integer_vote(@vote.voters, :one_vote_weight, @vote.required)

    @vote.voters.each do |v| 
      legislator = Legislator.create_or_update(v[1]["voter"])
      unless legislator.votes.include?(@vote)
      legislator.votes << @vote      
      end
    end                      
  end

  def find
    vote = Vote.get_votes([params[:vote]["roll_id"]])
    redirect_to vote_path( {id: vote[0].id} )
  end

end
