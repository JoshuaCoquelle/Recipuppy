class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show]
  before_action :find_user_recipe, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all.order('id DESC')
  end

  def show
    @comment = Comment.new
    @like = @post.likes.where(user: current_user).first
    @favorite = @post.favorites.where(user: current_user).first
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end  

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :ingredients, :potential_allergens)
  end

  def find_user_recipe
    @post = current_user.posts.find(params[:id])
  end
end