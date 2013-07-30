class BillsController < ApplicationController

  def find
    sun_bill_id = [params[:bill_type] + params[:bill_number] + "-" + params[:congress]]
    bill = Bill.get_bills(sun_bill_id)
    @bill = bill[0]
    @votes = Vote.get_votes(@bill.vote_list)
    render :show
  end

  def show
    @bill = Bill.find(params[:id])
    @votes = @bill.votes
  end

end
