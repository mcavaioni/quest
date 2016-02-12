class AnswersController < ApplicationController


  def new
    @answer = Answer.new
    @survey = Survey.find(params[:survey_id])  
    # @survey.questions.build
  end

  def index

  end

  def create
    # binding.pry
    # @survey = survey.find(@answer.survey_id)
    # @answer = @survey.answers.create(answer_params)
    # @survey.questions.answer.build(answer_params)
    @answer = Answer.new(answer_params)
    @answer.save
      html_string = render_to_string 'answers/_answer', locals:{answer: @answer}, layout: false
      render json: {template: html_string}
    # @reservation.valid?
    # render json: ReservationJsonViewObject.new(@reservation).get_json_for_reservation
    # else
    #   flash[:danger] = "If you are not able to answer a question please click on 'create answer and submit it as empty"
    #   html_string = render_to_string 'answers/_answer', locals:{answer: @answer}, layout: false
    #   render json: {template: html_string}
    # end
  end

  def edit
    @answer=Answer.find(params[:id])
    session[:return_to] ||= request.referer
  end

  def update
    @answer=Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:success]="Answer successfully updated"
      redirect_to session.delete(:return_to)
    else
      redirect 'edit'
    end
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