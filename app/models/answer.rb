class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :attempt
  has_many   :selected_variants, dependent: :destroy
end
