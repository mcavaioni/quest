class AnswersController < ApplicationController


  def new
    @answer = Answer.new
    @survey = Survey.find(params[:survey_id])  
    # @survey.questions.build
  end

  def create
    # binding.pry
    # @survey = survey.find(@answer.survey_id)
    # @answer = @survey.answers.create(answer_params)
    @answer = Answer.create(answer_params)

    html_string = render_to_string 'answers/_answer', locals:{answer: @answer}, layout: false
    render json: {template: html_string}
    # @reservation.valid?
    # render json: ReservationJsonViewObject.new(@reservation).get_json_for_reservation
  end


  def show
    @survey=Survey.find(params[:survey_id])  
    # @answer=Answer.find(params[:id])
  end

  def destroy
  end



  private

  def answer_params
    params.require(:answer).permit(:content, :question_id, :survey_id)
  end


end