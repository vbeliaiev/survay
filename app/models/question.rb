class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :variants
  has_many :answers

  enum type: { has_one_answer: 0, has_multiple_answers: 1, comparison: 2 }

  self.inheritance_column = :none
end
