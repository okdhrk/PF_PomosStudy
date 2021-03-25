class PomoTimerController < ApplicationController
  before_action :authenticate_user!

  def short_time
    @user = current_user
  end

  def long_time
    @user = current_user
  end

  def short_resr
    @user = current_user
  end

  def long_rest
    @user = current_user
  end
end
