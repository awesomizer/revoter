class CongressApiController < ApplicationController


  def bill
    api = CongressApi.new
    results = api.get_bill(params[:bill_type], params[:bill_number], params[:congress])
    results = bill_results["results"][0]
    @bill = Bill.find_or_create_by(sun_bill_id: results["bill_id"]) do |b|
                        b.official_title: results["official_title"], 
                        b.nicknames: results["nickname"], 
                        b.summary_short: results["summary_short"], 
                        b.last_vote_at: results["last_vote_at"], 
                        b.last_action: results["last_action"], 
                        b.vote_list: results["votes"],
                        b.urls: results["urls"])
    end
      @votes = votes(@bill.vote_list)
  end
  

  private

  def votes vote_list
    api = CongressApi.new
    vote_list.each do |v|
      @votes = []
      results = api.get_vote(v["roll_id"])
      results = vote_results["results"][0]
      @votes << Vote.find_or_create_by(roll_id: results["roll_id"]) do |v|
                          v.question: results["question"], 
                          v.required: results["required"], 
                          v.result: results["result"], 
                          v.vote_type: results["vote_type"],
                          v.breakdown: results["breakdown"],
                          v.roll_call: roll_call(vote_results["voter_ids"]), 
                          v.bill_id: @bill.id)
      end
    end
  end

  def roll_call voter_ids
    api = CongressApi.new
    roll_call = []
    voter_ids.each do |id|
      results = api.get_legislator(id.key)
      results = results["results"][0]
      roll_call << {vote_record: {bioguide_id: results[id.key],
                    state: results["state"],
                    state_rank: results["state_rank"],
                    first_name: results["first_name"],
                    nickname: results["nickname"],
                    last_name: results["last_name"]}}
    end
    roll_call
  end

end
