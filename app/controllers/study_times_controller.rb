class StudyTimesController < ApplicationController

  def index
    @user = current_user
    @study_time = current_user.study_times.last
  end

  def study_time
    @user = current_user
    @study_time = current_user.study_times

    # 月毎にページを切り替える
    @year = []
    (-12..0).each do |month|
      @month = []
      @day = (month.month.from_now.beginning_of_month.to_date)
      @month = (@day..@day.end_of_month.to_date)

      @year.unshift(@month)
    end
    @year = Kaminari.paginate_array(@year).page(params[:page]).per(1)

  end

  def edit
    @study_times = StudyTime.find(params[:id])
  end

  def new
  end

  def create
    study_time = StudyTime.new(study_time_params)
    study_time.user_id = current_user.id
    study_time.begin_time = Time.current
    study_time.save
    redirect_to study_times_path
  end

# 打刻
  def update
    user = current_user
    study_time = user.study_times.last
    if study_time.begin_time.to_date == Time.current.to_date
      study_time.finish_time = Time.current
      study_time.update(study_time_params)
      redirect_to study_times_path
    else
      # begin_timeと同じ日にちの23:59がfinish_timeにupdateされる
      a = study_time.begin_time.to_date
      ya = a.year
      mo = a.month
      da = a.day
      start_time = Time.new(ya, mo, da, 23, 59, 0)
      study_time = study_time.finish_time.to_date
      study_time = start_time
      study_time.update(study_time_params)

      # begin_timeの次の日にちの00:00がnewしてbegin_timeにcreateされる
      study_time = StudyTime.new(study_time_params)
      end_time = Time.new(ya, mo, da + 1, 00, 00, 0)
      study_time = study_time.begin_time.to_date
      study_time = end_time
      study_time.save(study_time_params)

      # 打刻した時間
      study_time.finish_time = Time.current
      study_time.update(study_time_params)
      redirect_to study_times_path
    end
  end

# 打刻の編集
  def update_time
    @study_time = current_user
    @study_time = StudyTime.find(params[:id])
    @study_time.update(study_time_update_params)
    redirect_to study_times_study_time_path
  end

  def destroy
    study_time = StudyTime.find(params[:id])
    study_time.destroy
    redirect_to study_times_study_time_path
  end


  private
  def study_time_params
    params.permit(:user_id, :total_time, :begin_time, :finish_time )
  end

  def study_time_update_params
    params.require(:study_time).permit(:begin_time, :finish_time )
  end

end