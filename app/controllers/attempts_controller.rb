class AttemptsController < ApplicationController
  load_and_authorize_resource :quiz
  load_resource :attempt, through: :quiz
  before_action  do authorize! :create_attempt, @quiz end

  def new
    @questions = @quiz.questions.shuffle
  end

  def create
    @attempt.build_answers(params[:questions])
    @attempt.user = current_user

    if @attempt.save
      redirect_to quizzes_path
    else
      flash[:error] = 'Ошибка сохранения'
      render :new
    end
  end
end
