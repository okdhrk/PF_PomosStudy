class UsersController < ApplicationController

  def index
    @users = User.all
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


  private

  def user_params
    params.require(:user).permit(:name, :image)
  end

end
