class QuestionsController < ApplicationController
  load_and_authorize_resource :quiz
  load_and_authorize_resource :question, through: :quiz

  def new
    @question.type = params.fetch(:type)
  end

  def create
    if @question.save
      redirect_to quiz_path(@quiz)
    else
      render :new
    end
  end

  protected

  def question_params
    params.require(:question).permit(
      :title,
      :type,
      variants_attributes: [
        :title,
        :correct,
        compare_attributes: :title
      ]
    )
  end

end
