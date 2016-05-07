FactoryGirl.define do
  factory :answer do
    association :question
    association :attempt
    correct { [true, false].sample }
  end
end
