class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post_id

  def create
    @comment      = @post.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: "Comment Saved Successfully" }
        format.js   { render }
      else
        format.html { redirect_to post_path(@post), alert: "Comment Couldn't be Posted" }
        format.js   { render }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "Comment deleted successfully!" }
      format.js   { render }
    end 
  end

  private

  def find_post_id
    @post = Post.find(params[:post_id])
  end


  def comment_params
    params.require(:comment).permit(:body)
  end

end
