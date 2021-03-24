class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    body = current_user.answers.new(answer_params)
    body.question_id = @question.id
    body.save
    redirect_to question_path(@question)
  end

  def destroy
    Answer.find(params[:id]).destroy
    redirect_to question_path(params[:question_id])
  end


  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
