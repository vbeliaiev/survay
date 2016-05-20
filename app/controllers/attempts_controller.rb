class AttemptsController < ApplicationController
  load_and_authorize_resource :quiz
  load_resource :attempt, through: :quiz
  before_action  do authorize! :create_attempt, @quiz end

  def new
  end

  def create
    if @attempt.save
      redirect_to quiz_path(@quiz)
    else
      render :new
    end
  end
end
