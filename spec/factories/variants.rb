FactoryGirl.define do
  factory :variant do
    title { FFaker::Lorem.sentence }
    correct { [true, false].sample }
    association :question
    association :compare
  end
end
