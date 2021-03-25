class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: [:index, :search]

  def index
    @users = User.all
    @users = User.page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @user_question = @user.questions.page(params[:page]).per(3).order(created_at: :desc)
    @user_tweet = @user.tweets.page(params[:page]).per(3).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    # ログインユーザーでないとき
    if @user != current_user
      redirect_to tweets_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to tweets_path
    else
      render 'users/edit'
    end
  end

  def unsubscribe
  end

  # フォロー機能
  def followings
    @user =User.find(params[:id])
    @users =@user.followings.page(params[:page])
  end

  def followers
    @user =User.find(params[:id])
    @users =@user.followers.page(params[:page])
  end

  def search
    @results = @q.result
  end


  private

  def set_q
    @q = User.ransack(params[:q])
  end

  def user_params
    params.require(:user).permit(:name, :image, :user_genre)
  end

end
