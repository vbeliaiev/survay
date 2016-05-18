class Variant < ActiveRecord::Base
  belongs_to :question
  belongs_to :compare
  has_many :selected_variants, dependent: :destroy
end
