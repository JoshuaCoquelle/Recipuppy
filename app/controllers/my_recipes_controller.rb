class MyRecipesController < ApplicationController

  def index
    @recipes = current_user.posts.paginate(page: params[:page]).order('id DESC')
  end
  
end
