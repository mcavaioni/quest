class AnswersController < ApplicationController


  def new
    @answer = Answer.new
    @survey = Survey.find(params[:survey_id])  
    # @survey.questions.build
  end

  def create
    binding.pry
    # @answer = Answer.create(answer_params)
    redirect_to :back
  end

  def destroy
  end



  private

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end


end