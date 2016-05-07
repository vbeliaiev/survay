FactoryGirl.define do
  factory :selected_variant do
    association :answer
    association :variant

    trait :with_compare do
      association :compare
    end
  end
end
