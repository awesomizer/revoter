class CongressApiController < ApplicationController


  def bill
    api = CongressApi.new
    bill_results = api.get_bill(params[:bill_type], params[:bill_number], params[:congress])
    bill_results = bill_results["results"][0]
    @bill = Bill.new(official_title: bill_results["official_title"], 
                     nicknames: bill_results["nickname"], 
                     summary_short: bill_results["summary_short"], 
                     last_vote_at: bill_results["last_vote_at"], 
                     last_action: bill_results["last_action"], 
                     vote_list: bill_results["votes"],
                     urls: bill_results["urls"])
      @votes = votes(@bill.vote_list)
  end
  
  def votes vote_list
    vote_list.each do |v|
      @votes = []
      vote_results = api.get_vote(v["roll_id"])
      vote_results = vote_results["results"][0]
      @votes << Vote.new(question: vote_results["question"], 
                           required: vote_results["required"], 
                           result: vote_results["result"], 
                           roll_id: vote_results["roll_id"], 
                           vote_type: vote_results["vote_type"],
                           breakdown: vote_results["breakdown"],
                           voter_ids: vote_results["voter_ids"], 
                           bill_id: @bill.id)
    end
  end

end
