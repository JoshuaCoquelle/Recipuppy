class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post_id

  def create
    @comment      = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: "Comment Saved Successfully"
    else
      redirect_to post_path(@post), notice: "Comment Couldn't be Posted"
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), notice: "Comment Deleted Successfully"
  end

  private

  def find_post_id
    @post = Post.find(params[:post_id])
  end


  def comment_params
    params.require(:comment).permit(:body)
  end

end
