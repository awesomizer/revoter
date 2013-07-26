# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :state do
    id 1
    code 'AK'
    name 'Alaska'
    population 1000000
    pop_percent 2.10
    one_vote_weight 2
  end
end
