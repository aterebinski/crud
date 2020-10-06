class PostsController < ApplicationController
  def index

    @posts = Post.all
  end

  def new
    @post = Post.new(author: session[:author])
  end

  def create
    @post = Post.new(create_post_params)
    @post.save
    session[:author] = @post.author
    flash[:notice] = "Rekord dodany poprawnie!"
    redirect_to posts_path
  end

  def edit
  end

  def update
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
  end

  def create_post_params
    params.require(:post).permit(:title, :author, :body, :published )
  end

end
