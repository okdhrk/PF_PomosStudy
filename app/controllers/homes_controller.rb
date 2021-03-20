class HomesController < ApplicationController
  def index
    @user = current_user
  end

  def about
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to user_path(user.id), notice: 'ゲストユーザーとしてログインしました。'
  end

end
