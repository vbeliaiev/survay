# -------- Quiz and questions -------------

quizzes = FactoryGirl.create_list :quiz, 100

quizzes.map do |quiz|
  FactoryGirl.create_list :question_with_one_answer, [*1..5].sample, variants_count: [*2..5].sample, quiz: quiz
  FactoryGirl.create_list :questiion_with_multiple_answers, [*1..5].sample, variants_count: [*2..5].sample, quiz: quiz
  FactoryGirl.create_list :comparison, [*1..5].sample, variants_count: [*2..5].sample, quiz: quiz
end

#---------- User and attempts -------------

users = FactoryGirl.create_list :user, 10

# [A1, A2, A3, ...]
attempts = users.map do |user|
  quizzes.map do |quiz|
    FactoryGirl.create :attempt, user: user, quiz: quiz
  end
end.flatten

attempts.each do |attempt|
  attempt.quiz.questions.each do |question|
    case question.type.to_sym
    when :has_one_answer
      sv = question.variants.sample
      answer = FactoryGirl.create :answer, question: question, attempt: attempt, correct: sv.correct
      FactoryGirl.create :selected_variant, answer: answer, variant: sv
    when :has_multiple_answers
      if rand(1..3) == 1
        # ------ Right answer ------------
        answer = FactoryGirl.create :answer, question: question, attempt: attempt, correct: true

        question.variants.select(&:correct).each do |v|
          FactoryGirl.create :selected_variant, answer: answer, variant: v
        end
      else
        # ------ False answer -----------
        answer = FactoryGirl.create :answer, question: question, attempt: attempt, correct: false

        question.variants.sample(rand(1..question.variants.count)).each do |v|
          FactoryGirl.create :selected_variant, answer: answer, variant: v
        end
      end
    when :comparison
      if rand(1..3) == 1
        # ------ Right answer ------------
        answer = FactoryGirl.create :answer, question: question, attempt: attempt, correct: true
        question.variants.each do |v|
          FactoryGirl.create :selected_variant, answer: answer, variant: v, compare: v.compare
        end
      else
        # ------ False answer -----------
        answer = FactoryGirl.create :answer, question: question, attempt: attempt, correct: false
        compares = question.variants.map(&:compare)
        question.variants.each do |v|
          FactoryGirl.create :selected_variant, answer: answer, variant: v, compare: compares.sample
        end
      end
    end
  end
end
