class TasksController < ApplicationController
  before_action :set_task, only: [:show, :destroy, :update, :edit]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create(check_params)

    redirect_to task_path(task.id)
  end

  def edit; end

  def update
    @task.update(check_params)

    redirect_to task_path(@task.id)
  end

  def destroy
    @task.delete

    redirect_to root_path
  end

  private

  def set_task
    @task = Task.find(params[:id].to_i)
  end

  def check_params
    params.require(:task).permit(:title, :details)
  end
end
