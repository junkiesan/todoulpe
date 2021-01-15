class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]
  
  # GET /tasks
  def index
    # pundit scope
    @tasks = policy_scope(Task)
    # Defined all kind of tasks
    @tasks = Task.all
    @todo = Task.todo
    @completed = Task.completed

    respond_to do |f|
      f.html
      f.json { render json: @tasks }
    end
  end

  # GET /tasks/:id
  def show
    render json: @tasks
    authorize @task
  end

  # GET /tasks/new
  def new
    @task = Task.new
    authorize @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    authorize @task

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

  # PATCH/PUT /tasks/:id
  def update
    authorize @task
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

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    authorize @task
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
