class QuestionsController < ApplicationController

  def index
    @questions=Question.all
  end

  def new
    @question=Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Question successfully created"
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = "Question successfully updated"
      redirect_to question_path(@question)
    else
      redirect 'edit'
    end
  end


  def show
    @question = Question.find(params[:id])
  end



  private

  def question_params
    params.require(:question).permit(:title, :content)
  end


end
