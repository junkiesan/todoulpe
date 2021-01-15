class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

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

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end
  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:details)
  end
end