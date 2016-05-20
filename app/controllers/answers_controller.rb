class AnswersController < ApplicationController
  def index
    @answers = Attempt.where(user_id: current_user.id,
                             quiz_id: params[:quiz_id]).last.answers.includes(:question).paginate(page: params[:page], per_page: 15)
    @quiz = Quiz.find(params[:quiz_id])
    @total_result = 'Total: ' + (@answers.count - @answers.where(correct: true).count).to_s
  end
end