FactoryBot.define do 
  factory :bar do 
    name { Faker::Restaurant.name }
    minimum_age { Faker::Number.within(range: 1..10) }
    rating { Faker::Number.within(range: 1..10) }
  end
end