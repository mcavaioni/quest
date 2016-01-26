class QuestionnairesController < ApplicationController

  def new
    @questionnaire = Questionnaire.new
  end

  def index
    @questionnaires = Questionnaire.all
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    if @questionnaire.save
      flash[:success] = "Questionnaire successfully created"
      redirect_to questionnaires_path
    else
      render 'new'
    end
  end

  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end

  def update
    @questionnaire = Questionnaire.find(params[:id])
    if @questionnaire.update(questionnaire_params)
      redirect_to questionnaire_path
    else
      render 'edit'
    end
  end

  def show
    @questionnaire = Questionnaire.find(params[:id])
  end

  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy
    flash[:danger] = "Questionnaire has been deleted"
    redirect_to questionnaires_path
  end

  

  private

  def questionnaire_params
    params.require(:questionnaire).permit(:name, question_ids:[])
  end
  

end