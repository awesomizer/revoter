class CongressApiController < ApplicationController

    Bill = Struct.new( 
      :titles, 
      :official_title, 
      :nickname, 
      :summary_short, 
      :last_vote_at, 
      :last_action, 
      :history, 
      :votes, 
      :urls)

  def bill
    api = CongressApi.new
    results = api.find_bill(params[:bill_type], params[:bill_number], params[:congress])
    results = results["results"][0]
    @bill = Bill.new(results["titles"], results["official_title"], results["nickname"], results["summary_short"], results["last_vote_at"], results["last_action"], results["history"], results["votes"], results["urls"])
  end
  
  def votes
  end

end
