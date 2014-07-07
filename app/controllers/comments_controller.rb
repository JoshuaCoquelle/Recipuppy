class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post         = Post.find(params[:post_id])
    @comment      = @post.comments.build(params.require(:comment).permit(:body))
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: "Comment Saved Successfully"
    else
      redirect_to post_path(@post), notice: "Comment Couldn't be Posted"
    end
  end

  def destroy
    @post    = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), notice: "Comment Deleted Successfully"
  end

end
