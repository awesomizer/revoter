# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    id 1
    roll_id "s168-2013"
    vote_type "vote"
    question "Should we do it?"
    required "1/2"
    result "Bill Passed"
    voters { { "A000360"=>{"vote"=>"Yea", "voter"=>{"bioguide_id"=>"A000360", "birthday"=>"1940-07-03", "chamber"=>"senate", "contact_form"=>"http://www.alexander.senate.gov/public/index.cfm?p=Email", "crp_id"=>"N00009888", "district"=>nil, "facebook_id"=>"89927603836", "fax"=>"202-228-3398", "fec_ids"=>["S2TN00058", "P60003225"], "first_name"=>"Lamar", "gender"=>"M", "govtrack_id"=>"300002", "in_office"=>true, "last_name"=>"Alexander", "lis_id"=>"S289", "middle_name"=>nil, "name_suffix"=>nil, "nickname"=>nil, "office"=>"455 Dirksen Senate Office Building", "party"=>"R", "phone"=>"202-224-4944", "senate_class"=>2, "state"=>"TN", "state_name"=>"Tennessee", "state_rank"=>"senior", "thomas_id"=>"01695", "title"=>"Sen", "twitter_id"=>"senalexander", "votesmart_id"=>15691, "website"=>"http://www.alexander.senate.gov", "youtube_id"=>"lamaralexander"}}, 
             "A000368"=>{"vote"=>"Yea", "voter"=>{"bioguide_id"=>"A000368", "birthday"=>"1968-06-27", "chamber"=>"senate", "contact_form"=>"http://www.ayotte.senate.gov/?p=contact", "crp_id"=>"N00030980", "district"=>nil, "facebook_id"=>"123436097729198", "fec_ids"=>["S0NH00235"], "first_name"=>"Kelly", "gender"=>"F", "govtrack_id"=>"412493", "in_office"=>true, "last_name"=>"Ayotte", "lis_id"=>"S340", "middle_name"=>nil, "name_suffix"=>nil, "nickname"=>nil, "office"=>"144 Russell Senate Office Building", "party"=>"R", "phone"=>"202-224-3324", "senate_class"=>3, "state"=>"NH", "state_name"=>"New Hampshire", "state_rank"=>"junior", "thomas_id"=>"02075", "title"=>"Sen", "twitter_id"=>nil, "votesmart_id"=>42352, "website"=>"http://www.ayotte.senate.gov", "youtube_id"=>"SenatorAyotte"}}, 
             "B001230"=>{"vote"=>"Yea", "voter"=>{"bioguide_id"=>"B001230", "birthday"=>"1962-02-11", "chamber"=>"senate", "contact_form"=>"http://www.baldwin.senate.gov/contact.cfm", "crp_id"=>"N00004367", "district"=>nil, "facebook_id"=>"7357041101", "fax"=>"202-225-6942", "fec_ids"=>["H8WI00018", "S2WI00219"], "first_name"=>"Tammy", "gender"=>"F", "govtrack_id"=>"400013", "in_office"=>true, "last_name"=>"Baldwin", "lis_id"=>"S354", "middle_name"=>nil, "name_suffix"=>nil, "nickname"=>nil, "office"=>"1 Russell Courtyard", "party"=>"D", "phone"=>"202-224-5653", "senate_class"=>1, "state"=>"WI", "state_name"=>"Wisconsin", "state_rank"=>"junior", "thomas_id"=>"01558", "title"=>"Sen", "twitter_id"=>"SenatorBaldwin", "votesmart_id"=>3470, "website"=>"http://www.baldwin.senate.gov", "youtube_id"=>"witammybaldwin"}} } }

  end
end
