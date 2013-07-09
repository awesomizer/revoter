class VotesController < ApplicationController

  def show
    @vote = Vote.where(roll_id: params[:roll_id])
  end

end
