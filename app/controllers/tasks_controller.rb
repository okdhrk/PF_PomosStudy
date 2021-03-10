class TasksController < ApplicationController

  def index
    @user = current_user
    @tasks = @user.tasks
  end

  def show
    @task = target_task(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.user_id = current_user.id
    task.save
    redirect_to tasks_path
  end

  def edit
    @task = target_task(params[:id])
  end

  def update
    @task = target_task(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = target_task(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


  private

  def target_task(task_id)
    current_user.tasks.where(id: task_id).take
  end

  def task_params
    params.require(:task).permit(:user_id, :body, :target_at, :completed_at, :completed, :start_time )
  end

end
