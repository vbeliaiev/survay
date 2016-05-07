FactoryGirl.define do
  factory :question do
    title { FFaker::Lorem.sentence } 
    type { Question.types.values.sample }
    association :quiz

    factory :question_with_one_answer do
      type { Question.types[:has_one_answer] }

      transient do
        variants_count 4
      end

      after(:create) do |question, evaluator|
        variants = create_list(:variant, evaluator.variants_count, correct: false, question: question)
        variants.sample.update_column(:correct, true)
      end
    end

    factory :questiion_with_multiple_answers do
      type { Question.types[:has_multiple_answers] }

      transient do
        variants_count 4
      end

      after(:create) do |question, evaluator|
        create_list(:variant, evaluator.variants_count, question: question)
      end
    end

    factory :comparison do
      type { Question.types[:comparison] }

      transient do
        variants_count 4
      end

      after(:create) do |question, evaluator|
        create_list(:variant, evaluator.variants_count, :with_compare, question: question)
      end
    end
  end
end
