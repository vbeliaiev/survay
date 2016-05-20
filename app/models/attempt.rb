class Attempt < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :user
  has_many   :answers, dependent: :destroy

  def build_answers(questions_params)
    questions_params.each do |question_id, user_choice|
      compares = user_choice.fetch(:compares, {})
      selected_variants = if compares.present?
        user_choice.fetch(:variants, {}).select { |_,v| v.present? }
                   .map { |k,v| [k, compares.fetch(v, nil)] }.to_h
      else
        [user_choice.fetch(:variant_ids,[])].flatten.select(&:present?)
                    .map { |v| [v,nil] }.to_h
      end

      build_answer(
        question_id: question_id,
        selected_variants: selected_variants
      )
    end
  end

  private

  # Selected variants: { variant_id => compare_id, ... }
  def build_answer(question_id:, selected_variants:)
    return if selected_variants.blank?
    answer = answers.build(question_id: question_id)
    selected_variants.each do |variant_id, compare_id|
      answer.selected_variants.build(
        variant_id: variant_id,
        compare_id: compare_id
      )
    end
  end
end
