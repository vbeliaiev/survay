class AttemptsController < ApplicationController
  load_and_authorize_resource :quiz, only: [:index, :new, :create]
  load_resource :attempt, through: :quiz, except: [:total]
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
      redirect_to total_attempt_path(@attempt)
    else
      flash[:error] = 'Ошибка сохранения'
      render :new
    end
  end

  def total
    @attempt = Attempt.find(params[:id])
    authorize! :view_result, @attempt
    @answers = @attempt.answers
    @total_result = (@answers.count - @answers.where(correct: false).count).to_s + ' из ' + @answers.count.to_s
  end

  protected

  def authorize_creating
    authorize! :create_attempt, @quiz
  end
end
