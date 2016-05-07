class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :variants
  has_many :selected_variants

  self.inheritance_column = :none
end
