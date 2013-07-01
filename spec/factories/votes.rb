# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    roll_id "MyString"
    vote_type "MyString"
    question "MyString"
    required "MyString"
    voter_ids "MyText"
    result "MyString"
  end
end
