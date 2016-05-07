FactoryGirl.define do
  factory :selected_variant do
    association :attempt
    association :question
    association :variant
    association :compare
  end
end
