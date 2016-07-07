class AttemptsController < ApplicationController
  load_and_authorize_resource :quiz
  load_resource :attempt, through: :quiz
  before_action :authorize_creating, only: [:new, :create]

  def index
    authorize! :read, Attempt
    @attempts = @quiz.attempts
                     .includes(:user)
                     .paginate(page: params[:page], per_page: 15)
  end

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

  protected

  def authorize_creating
    authorize! :create_attempt, @quiz
  end
end
