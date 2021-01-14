class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:task).permit(:title, :priority, :deadline, :status)
  end
end
