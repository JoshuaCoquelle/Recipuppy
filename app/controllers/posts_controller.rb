class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit([:title, :description, :ingredients, :potential_allergens]))
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end  

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params.permit(:post).permit([:title, :description, :ingredients, :potential_allergens]))
      redirect_to "post_path(@post)"
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post = Post.destroy
    redirect_to 'posts_path'
  end

end