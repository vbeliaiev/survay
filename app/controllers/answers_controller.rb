class AnswersController < ApplicationController
  load_and_authorize_resource :attempt

  def index
    @answers = @attempt.answers
                       .includes(:question)
                       .paginate(page: params[:page], per_page: 15)
    @total_result = 'Итог: ' + (@answers.count - @answers.where(correct: false).count).to_s + ' из ' + @answers.count.to_s
  end
end
