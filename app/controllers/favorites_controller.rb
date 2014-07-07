class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def create
    @favorite      = @post.favorites.new
    @favorite.user = current_user
    if @favorite.save
      redirect_to @post, notice: "Recipe favorited!"
    else
      redirect_to @post, notice: "Couldn't favorite recipe."
    end
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    if @favorite.destroy
      redirect_to @post, notice: "Recipe unfavorited."
    else
      redirect_to @post, notice: "Recipe couldn't be unfavorited."
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

end
