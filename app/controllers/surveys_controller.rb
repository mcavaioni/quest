class SurveysController < ApplicationController


  def index
    
    # binding.pry
  end

  def new
    @survey = Survey.new
    @survey.questions.build
  end

  def create
    # binding.pry
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
    # do i need this one?
    # @answer = Answer.new
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:danger] = "Questionnaire has been deleted"
    redirect_to surveys_path
  end

  def unanswered
    @unanswered =[]
    Survey.all.each do |survey|
      if survey.questions.any?{|a| a.answer == nil} 
        @unanswered << survey
      end
    end
    if @unanswered!=nil
      @surveys = @unanswered
    else 
      flash[:success] = "All the questionnaires have been answered"
    end
  end

  def answered
    @answered =[]
    Survey.all.each do |survey|
      if survey.questions.all?{|a| a.answer != nil} 
        @answered << survey
      end
    end
    if @answered!=nil
      @answered
    else 
      flash[:danger] = "There are no answered questionnaires!"
    end
    # binding.pry

  end


  private

  def survey_params
    params.require(:survey).permit(:name, :product, :deadline, :user_id, :question_ids => [], :questions_attributes => [:id, :title, :content])
  end
end