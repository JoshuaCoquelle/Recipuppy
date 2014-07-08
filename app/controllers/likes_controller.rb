class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def create
    @like      = @post.likes.new
    @like.user = current_user
    if @like.save
      redirect_to @post, notice: "Recipe liked!"
    else 
      redirect_to @post, notice: "Couldn't like recipe."
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    if @like.destroy
      redirect_to @post, notice: "Recipe Unliked."
    else
      redirect_to @post, notice: "Couldn't unlike."
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

end
