class MyRecipesController < ApplicationController

  def index
    @recipes = current_user.posts
  end
  
end
