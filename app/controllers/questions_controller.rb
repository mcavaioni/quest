class QuestionsController < ApplicationController


  def new
    @question=Question.new
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


  private

  def question_params
    params.require(:question).permit(:title, :content)
  end


end
