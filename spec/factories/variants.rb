FactoryGirl.define do
  factory :variant do
    title { FFaker::Lorem.sentence }
    correct { [true, false].sample }
    association :question

    trait :with_compare do
      association :compare
      correct nil
    end
  end
end
