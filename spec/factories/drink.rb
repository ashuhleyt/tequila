FactoryBot.define do 
  factory :drink do 
    name { Faker::TvShows::AquaTeenHungerForce.character }
    proof { Faker::Beer.alcohol }
    made_in_mexico { true }
  end
end