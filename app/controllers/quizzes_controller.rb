class QuizzesController < ApplicationController
  load_and_authorize_resource

  def index
    @quizzes = Quiz.order(created_at: :desc).paginate(page: params[:page], per_page: 15)
  end

  def new
  end

  def create
    if @quiz.save
      redirect_to quizzes_path
    else
      render :new
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(
        :title
    ).merge(
        status: params[:quiz][:status].try(:to_i) || 0
    )
  end

end
