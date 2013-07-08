# Read about factories at https://github.com/thoughtbot/factory_girl

vote_list_array = [
  {
    "acted_at"=>"2013-06-27", 
    "how"=>"roll", 
    "references"=>[
      {"reference"=>"CR S5357-5475", 
       "type"=>"text"}], 
    "result"=>"pass", 
    "text"=>"Passed Senate with an amendment by Yea-Nay Vote. 68 - 32. Record Vote Number: 168.", 
    "type"=>"vote", 
    "vote_type"=>"vote", 
    "chamber"=>"senate", 
    "roll_id"=>"s168-2013"
  }
]

FactoryGirl.define do
  factory :bill do
    official_title "Best Bill"
    summary_short "Awesomeness, thanks."
    last_vote_at "2013-07-01 16:35:11"
    last_action "Winning"
    nicknames "#1 Bill"
    urls "http://www.bestbill.com"
    sun_bill_id "s744-113"
    vote_list vote_list_array
  end
end
