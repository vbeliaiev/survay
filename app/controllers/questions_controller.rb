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

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to quiz_path(@quiz)
    else
      render :new
    end
  end

  def destroy
    if @question.destroy
      @quiz.attempts.destroy_all
      redirect_to quiz_path(@quiz)
    else
      redirect_to :back
    end
  end

  protected

  def question_params
    params.require(:question).permit(
      :title,
      :type,
      variants_attributes: [
        :id,
        :title,
        :correct,
        :_destroy,
        compare_attributes: :title
      ]
    )
  end

end
