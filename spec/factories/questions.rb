FactoryGirl.define do
  factory :question do
    title { FFaker::Lorem.sentence } 
    type { [1,2,3].sample }
    association :quiz
  end
end
