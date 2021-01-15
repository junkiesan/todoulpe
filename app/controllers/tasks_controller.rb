class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  def index
    # @tasks = policy_scope(Task)
    # authorize @task
    # Defined all kind of tasks
    @tasks = Task.all
    @todo = Task.todo
    @completed = Task.completed

    respond_to do |f|
      f.html
      f.json { render json: @tasks }
    end
  end

  def show
    render json: @tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |f|
      if @task.save 
        f.html { redirect_to @task }
        f.json
      else
        f.html { render :new }
        f.json { error }
      end
    end
  end

  def update
    respond_to do |f|
      if @task.update(task_params)
        f.html { redirect_to @task }
        f.json { render :show }
      else 
        f.html { render :edit }
        f.json { error }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |f|
      f.html { redirect_to task_url }
      f.json { render :index }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def task_params
    params.permit(:title, :priority, :deadline, :status)
  end
end
