class MyFavoritesController < ApplicationController
  
  def index
    @my_favorites = current_user.favorited_posts.paginate(page: params[:page]).order('id DESC')
  end

end