FactoryGirl.define do
  factory :quiz do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    status { [0,1].sample }
  end
end
