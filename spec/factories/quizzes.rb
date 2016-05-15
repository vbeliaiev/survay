FactoryGirl.define do
  factory :quiz do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    status { Quiz.statuses.values.sample }
  end
end
