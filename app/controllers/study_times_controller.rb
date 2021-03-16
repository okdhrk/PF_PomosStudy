class StudyTimesController < ApplicationController

  def index
    @user = current_user
    @study_time = StudyTime.all
  end

  def study_time
    @user = current_user
    @study_time = StudyTime.all
  end

  def edit
    @study_time = StudyTime.find(params[:id])
  end

  def new
  end

  def create
    study_time = StudyTime.new(study_time_params)
    study_time.user_id = current_user.id
    study_time.save
    redirect_to study_times_path
  end

  def update
    user = current_user
    study_time = user.study_times.last
    # 終了時刻の打刻
    if study_time.update(study_time_params)
    redirect_to study_times_path
    end
  end

  def destroy
    study_time = StudyTime.find(params[:id])
    study_time.destroy
    redirect_to study_times_study_time_path
  end


  private
  def study_time_params
    params.require(:study_time).permit(:user_id, :memo, :begin_time, :finish_time, :total_time )
  end

end
