class StudyTimesController < ApplicationController

  def index
    @user = current_user
    @study_time = StudyTime.all
  end

  def study_time
    @user = current_user
    @study_time = StudyTime.all
    #@study_time = StudyTime.page(params[:page]).per(1)

  end

  def edit
    @study_times = StudyTime.find_by(begin_time: params[:begin_time], finish_time: params[:finish_time])
  end

  def new
  end

  def create
    study_time = StudyTime.new(study_time_params)
    study_time.user_id = current_user.id
    study_time.save
    redirect_to study_times_path
  end

# 打刻
  def update
    user = current_user
    study_time = user.study_times.last
    study_time.updated_at = Time.now
    study_time.update(study_time_params)
    redirect_to study_times_path
  end

# 打刻の編集
  def update_time
    user = current_user
    study_time = user.study_time
    study_time.update(study_time_params)
    redirect_to study_times_study_time_path
  end

  def destroy
    study_time = StudyTime.find(params[:id])
    study_time.destroy
    redirect_to study_times_study_time_path
  end


  private
  def study_time_params
    params.permit(:user_id, :total_time )
  end

end
