class CongressApiController < ApplicationController

  def bill
    api = CongressApi.new
    @bill = api.find_bill(params[:bill_type], params[:bill_number], params[:congress])
    @bill = @bill["results"][0]
  end
  
  def votes
  end

end
