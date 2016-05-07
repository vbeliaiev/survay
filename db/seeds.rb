
quizzes = FactoryGirl.create_list :quiz, 100

# [Q1,Q2,Q3,...]
questions = quizzes.map do |quiz|
  FactoryGirl.create_list :question, [*4..10].sample, quiz: quiz
end.flatten

questions.each do |question|
  v = FactoryGirl.create_list :variant, 4, correct: false, question: question
  v.sample.update_column(:correct, true)
end

#-------------------------------------------

users = FactoryGirl.create_list :user, 10

# [A1, A2, A3, ...]
attempts = users.map do |user|
  quizzes.map do |quiz|
    FactoryGirl.create :attempt, user: user, quiz: quiz
  end
end.flatten

attempts.each do |attempt|
  attempt.quiz.questions.each do |question|
    FactoryGirl.create :selected_variant, attempt: attempt, question: question, variant: question.variants.sample
  end
end





