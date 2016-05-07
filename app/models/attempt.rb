class Attempt < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :user
  has_many   :answers
end
