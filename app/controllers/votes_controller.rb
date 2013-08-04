class VotesController < ApplicationController

  def show
    @vote = Vote.find(params[:id])
    @vote_types = Vote.vote_positions
    @popular_votes, @popular_tally = Vote.fractional_vote(@vote.voters, :pop_percent, @vote.required)
    @fractional_votes, @fractional_tally = Vote.fractional_vote(@vote.voters, :one_vote_weight, @vote.required)
    @seniority_votes, @seniority_tally = Vote.integer_vote(@vote.voters, :one_vote_weight, @vote.required)

    @vote.voters.each do |v|  
      # this would be more efficient if it was passing a list 
      # and then create_or_update was making one call to the api.  
      # But we're not calling very many legislators once the current one's are in the database, 
      # so it isn't a priority.
      legislator = Legislator.create_or_update(v[1]["voter"])
      unless legislator.votes.include?(@vote)
      legislator.votes << @vote      
      end
    end                      
  end

  def find
    if params[:vote]
      vote = Vote.get_votes([params[:vote]["roll_id"]])
    else
      vote = Vote.get_votes([params[:roll_id]]) 
    end
    redirect_to vote_path( {id: vote[0].id} ) 
  end

end
