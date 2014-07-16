class DangersController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])

    if @post.exceeded_max_dangers?
      @post.destroy
      redirect_to posts_path, notice: 'Post deleted for being dangerous'
    else
      @danger      = @post.dangers.new
      @danger.user = current_user
      if @danger.save
        redirect_to post_path(@post), alert: "Marked as dangerous"
      else
        redirect_to post_path(@post), alert: "Couldn't add Danger"
      end  
    end
  end

end
