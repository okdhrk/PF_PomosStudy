class BeginTimesController < ApplicationController

  def create
    BeginTime.create(begin_time_params)
    redirect_to tasks_path
  end


  private
  def begin_time_params
    params.permit(:task_id)
  end

end
