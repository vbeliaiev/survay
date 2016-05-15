class Quiz < ActiveRecord::Base
  has_many :questions
  enum status: { draft: 0, active: 1 }
end
