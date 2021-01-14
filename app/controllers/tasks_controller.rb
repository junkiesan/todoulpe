class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    # @tasks = policy_scope(Task)
    # authorize @task
    @tasks = Task.all
    @todo = Task.todo
    @completed = Task.completed
    end
    respond_to do |f|
      f.html
      f.json { render json: @tasks }
    end
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

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:task).permit(:title, :priority, :deadline, :status)
  end
end
