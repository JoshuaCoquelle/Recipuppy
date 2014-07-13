class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def index
    @user = current_user
    @favourites = @user.favourites
  end

  def create
    @favorite      = @post.favorites.new
    @favorite.user = current_user
    if @favorite.save
      redirect_to @post, notice: "Recipe favorited!"
    else
      redirect_to @post, alert: "Couldn't favorite recipe."
    end
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    if @favorite.destroy
      redirect_to @post, notice: "Recipe Unfavorited."
    else
      redirect_to @post, alert: "Recipe couldn't be Unfavorited."
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

end
