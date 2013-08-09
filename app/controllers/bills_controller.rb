class BillsController < ApplicationController

  def find
    sun_bill_id = [params[:bill_type] + params[:bill_number] + "-" + params[:congress]]
    bill = Bill.get_bills(sun_bill_id)
    @bill = bill[0]
    vote_array =[]
    @bill.vote_list.each do |vote|
      vote_array << vote["roll_id"]
    end
    @votes = Vote.get_votes(vote_array)
    render :show
  end

  def show
    @bill = Bill.find(params[:id])
    @votes = @bill.votes
  end

end
