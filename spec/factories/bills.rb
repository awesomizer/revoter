# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bill do
    official_title "MyString"
    summary_short "MyText"
    last_vote_at "2013-07-01 16:35:11"
    last_action "MyString"
    nicknames "MyText"
    urls "MyText"
  end
end
