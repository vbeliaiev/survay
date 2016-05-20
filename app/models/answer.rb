class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :attempt
  has_many   :selected_variants, dependent: :destroy
  has_many   :variants, through: :question

  after_create :update_correct_field

  private

  def update_correct_field
    correct = if question.comparison?
      selected_variants_hash = selected_variants.pluck(:variant_id, :compare_id).to_h
      !variants.detect { |v| selected_variants_hash[v.id] != v.compare_id }
    else
      correct_ids = variants.where(correct: true).pluck(:id)
      selected_ids = selected_variants.pluck(:variant_id)
      correct_ids.sort == selected_ids.sort
    end
    update_column(:correct, correct)
  end
end
