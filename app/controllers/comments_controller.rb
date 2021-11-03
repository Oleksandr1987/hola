class CommentsController < ApplicationController
  before_action :set_micropost, only: %i[create destroy]

    def create
      @comment = @micropost.comments.build(params[:comment].permit(:body))
      @comment.user = current_user
      @comment.save
      redirect_to micropost_path(@micropost)
    end

    def destroy
      @comment = @micropost.comments.find(params[:id])
      @comment.destroy
      redirect_to micropost_path(@micropost)
    end

    private

    def set_micropost
      @micropost = Micropost.find(params[:micropost_id])
    end
  end
