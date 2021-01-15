class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]
  
  # GET /tasks
  def index
    # pundit scope
    # @task = Task.new
    @tasks = policy_scope(Task)
    # Defined all kind of tasks
    @tasks = Task.all
    # @todo = Task.todo
    # @completed = Task.completed
    @comment = Comment.new
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
    @tasks = Task.all
    @task = Task.new(task_params)
    @task.user = current_user
    authorize @task

    respond_to do |f|
      if @task.save 
        f.html { redirect_to @task, notice: 'Task was successfully created.'  }
        f.json { render :show, status: :created, location: @task }
      else
        f.html { render :index }
        f.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/:id
  def update
    authorize @task
    respond_to do |f|
      if @task.update(task_params)
        f.html { redirect_to @task, notice: 'Task was successfully updated.' }
        f.json { render :show, status: :ok, location: @task }
      else 
        f.html { render :edit }
        f.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    authorize @task
    respond_to do |f|
      f.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      f.json { head :no_content }
    end
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
