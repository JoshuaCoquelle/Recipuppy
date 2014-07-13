class MyFavoritesController < ApplicationController
  
  before_action :find_user_fav

  def index
  end

  private

  def find_user_fav
    @favorites = Favorite.where("user_id = ?", current_user)
  end

end



