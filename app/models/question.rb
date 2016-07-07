class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :variants, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :compares, through: :variants

  enum type: { has_one_answer: 0, has_multiple_answers: 1, comparison: 2 }

  self.inheritance_column = :none

  accepts_nested_attributes_for :variants, allow_destroy: true

  validates_presence_of :title
end
