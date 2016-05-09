class SessionsController < ApplicationController
  def create
    user = login(params[:email], params[:password])
    if user
      redirect_to quizzes_path, notice: 'Logged in!'
    else
      flash[:error] = 'Email or password was invalid'
      redirect_to :back
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end

end
