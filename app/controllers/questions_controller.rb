class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :show, :destroy]

  
  def index
    @questions=Question.all
  end

  def new
    @question=Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question successfully created"
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def update
    if @question.update(question_params)
      flash[:success] = "Question successfully updated"
      redirect_to question_path(@question)
    else
      redirect 'edit'
    end
  end


  def show
  end

  def destroy
    @question.destroy
    flash[:danger] = "Question has been deleted"
    redirect_to questions_path
  end


  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def set_question
    @question = Question.find(params[:id])
  end


end
