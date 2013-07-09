class BillsController < ApplicationController

  def show
    api = CongressApi.new
    sun_bill_id = params[:bill_type] + params[:bill_number] + "-" + params[:congress]
    results = api.get_bill(sun_bill_id)
    results = results["results"][0]
    @bill = Bill.find_or_create_by_sun_bill_id(results["bill_id"]) do |b|
                        b.official_title = results["official_title"] 
                        b.nicknames = results["nickname"] 
                        b.summary_short = results["summary_short"] 
                        b.last_vote_at = results["last_vote_at"] 
                        b.last_action = results["last_action"] 
                        b.vote_list = results["votes"]
                        b.urls = results["urls"]
    end
      @votes = votes(@bill.vote_list)
  end

  private

  def votes vote_list
    api = CongressApi.new
    vote_list.each do |v|
      @votes = []
      results = api.get_vote(v["roll_id"])
      results = results["results"][0]
      @votes << Vote.find_or_create_by_roll_id(results["roll_id"]) do |v|
                          v.question = results["question"] 
                          v.required = results["required"] 
                          v.result = results["result"] 
                          v.vote_type = results["vote_type"]
                          v.breakdown = results["breakdown"]
                          v.voter_ids = results["voter_ids"]
                          v.voters = results["voters"]
                          v.bill_id = @bill.id
      end
    end
    @votes
  end

end
