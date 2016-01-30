class AnswersController < ApplicationController

  def create
    # binding.pry
    answer = Answer.create(answer_params)
    redirect_to :back
  end





  private

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end


end