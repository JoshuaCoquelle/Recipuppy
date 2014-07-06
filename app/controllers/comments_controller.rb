class CommentsController < ApplicationController

    def create
    @post = Post.find(params[:post_id])
    @comment = Post.comments.new(params.require(:comment).permit([:body]))
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: "Comment Saved Successfully"
    else
      redirect_to post_path(@post), notice: "Comment Couldn't be Posted"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Post.comments.find(params[:id])
    @comment.destroy
    redirect_to posts_path, notice: "Comment Deleted Successfully"
  end

end
