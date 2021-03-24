class QuestionsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @user = current_user
    @questions = Question.page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @user = @question.user
    @answer = Answer.new
  end

  def new
    @question = Question.new
    @user = current_user
  end

  def create
    question = Question.new(question_params)
    question.user_id = current_user.id
    question.save
    redirect_to questions_path
  end

  def edit
    @user = current_user
    @question = Question.find(params[:id])
    if @question.user != current_user
      redirect_to question_path(current_user.id)
    end
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
    if question.is_solved == true
      redirect_to questions_path
    else
      redirect_to question_path(question)
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path
  end

  def search
    @results = @q.result.page(params[:page]).per(5).order(created_at: :desc)
  end


  private

  def set_q
    @q = Question.ransack(params[:q])
  end

  def question_params
    params.require(:question).permit(:title, :body, :best_answer_id, :user_id, :is_solved, :answer_id)
  end

end
