class CongressApiController < ApplicationController


  def bill
    api = CongressApi.new
    results = api.find_bill(params[:bill_type], params[:bill_number], params[:congress])
    results = results["results"][0]
    @bill = Bill.new(official_title: results["official_title"], 
                     nicknames: results["nickname"], 
                     summary_short: results["summary_short"], 
                     last_vote_at: results["last_vote_at"], 
                     last_action: results["last_action"], 
                     vote_list: results["votes"],
                     urls: results["urls"])
  end
  
  def votes
  end

end
