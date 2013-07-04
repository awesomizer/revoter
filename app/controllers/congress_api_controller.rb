class CongressApiController < ApplicationController


  def bill
    api = CongressApi.new
    bill_results = api.get_bill(params[:bill_type], params[:bill_number], params[:congress])
    bill_results = bill_results["results"][0]
    @bill = Bill.find_or_create_by(sun_bill_id: bill_results["bill_id"]) do |b|
                        b.official_title: bill_results["official_title"], 
                        b.nicknames: bill_results["nickname"], 
                        b.summary_short: bill_results["summary_short"], 
                        b.last_vote_at: bill_results["last_vote_at"], 
                        b.last_action: bill_results["last_action"], 
                        b.vote_list: bill_results["votes"],
                        b.urls: bill_results["urls"])
    end
      @votes = votes(@bill.vote_list)
  end
  

  private

  def votes vote_list
    api = CongressApi.new
    vote_list.each do |v|
      @votes = []
      vote_results = api.get_vote(v["roll_id"])
      vote_results = vote_results["results"][0]
      @votes << Vote.find_or_create_by(roll_id: vote_results["roll_id"]) do |v|
                          v.question: vote_results["question"], 
                          v.required: vote_results["required"], 
                          v.result: vote_results["result"], 
                          v.vote_type: vote_results["vote_type"],
                          v.breakdown: vote_results["breakdown"],
                          v.roll_call: roll_call(vote_results["voter_ids"]), 
                          v.bill_id: @bill.id)
      end
    end
  end

  def roll_call voter_ids
    api = CongressApi.new
    roll_call = []
    legislator_results = api.roll_call(voter_ids)
    legislator_results = legislator_results["results"][0]
    roll_call << Legislator.create(bioguide_id: legislator_results["bioguide_id"],
                                      
    end
  end

end
