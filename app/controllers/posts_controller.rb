class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all.order('id DESC')
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end  

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to "post_path(@post)"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to 'posts_path'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:post).permit([:title, :description, :ingredients, :potential_allergens])
  end
end