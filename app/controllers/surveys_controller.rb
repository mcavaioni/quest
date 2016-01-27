class SurveysController < ApplicationController


  def index
    @surveys=Survey.all
  end

  def new
    @survey = Survey.new
    @survey.questions.build
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user
    if @survey.save
      flash[:success] = "Questionnaire successfully created"
      redirect_to survey_path(@survey)
    else
      render 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update(survey_params)
      flash[:success] = "Questionnaire successfully updated"
      redirect_to survey_path
    else
      render 'edit'
    end
  end


  def show
    @survey = Survey.find(params[:id])
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:danger] = "Questionnaire has been deleted"
    redirect_to surveys_path
  end




  private

  def survey_params
    params.require(:survey).permit(:name, :user_id, :question_ids => [], :questions_attributes => [:id, :title, :content])
  end
end