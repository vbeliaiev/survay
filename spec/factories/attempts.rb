FactoryGirl.define do
  factory :attempt do
    association :quiz
    association :user
  end
end
