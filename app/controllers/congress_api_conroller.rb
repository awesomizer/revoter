class CongressApiController < ApplicationController

  def bill
    @bill = CongressApi.find_bill(params[:bill_type], params[:bill_number], params[:chamber])
  end
  
  def votes
  end

end
