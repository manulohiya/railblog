class PostsController < ApplicationController
  #show all posts
  def index
    @posts = Post.all
    render :index

  end

  # form to create new recipe that belongs to current user
  def new
    @post = Post.new
    render :new
  end

  # creates new recipe in db that belongs to current user
  def create
    post = current_user.posts.create(post_params)
    redirect_to post_path(post)
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
    def post_params
    params.require(:post).permit(:title, :description) 
  end
end
