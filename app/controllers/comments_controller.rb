class CommentsController < ApplicationController
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

  def comment_params
    params.require(:comment).permit(:details)
  end
end