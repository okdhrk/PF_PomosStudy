class StopTimesController < ApplicationController

  def create
    StopTime.create(stop_time_params)
    redirect_to tasks_path
  end


  private
  def stop_time_params
    params.permit(:created_at, :task_id)
  end

end
