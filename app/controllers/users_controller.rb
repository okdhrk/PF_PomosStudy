class UsersController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @users = User.all
    @users = User.page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    # ログインユーザーでないとき
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def unsubscribe
  end

  # フォロー機能
  def followings
    @user =User.find(params[:id])
    @users =@user.followings.page(params[:page])
    render :show_followings
  end

  def followers
    @user =User.find(params[:id])
    @users =@user.followers.page(params[:page])
    render :show_followers
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
