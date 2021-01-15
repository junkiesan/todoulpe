class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    @comments = Comment.all

    respond_to do |f|
      f.html
      f.json { render json: @comments }
    end
  end

  def show
  end

  def new
    @task = Task.find(params[:task_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @task = Task.find(params[:task_id])
    respond_to do |f|
      if @comment.save
        f.html { redirect_to @task, notice: 'Task created successfully'}
        f.json
      else
        f.html { render :show }
        f.json { error }
    end
  end

  def destroy
    @comment.destroy
    respond_to do |f|
      f.html { redirect_to task_url }
      f.json { render :index }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end
  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:details)
  end
end