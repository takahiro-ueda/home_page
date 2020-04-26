class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    
    @post = Post.new
  end

  def create
    # binding.pry
    post = Post.create(post_params)
    redirect_to action: "index"
    # if @post.save
    #   redirect_to action: "index"
    #   flash[:success] = "投稿完了しました!"
    # else
    #   redirect_to action: "new"
    #   flash[:success] = "投稿失敗しました!"
    # end

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :content, :image)
    # params.require(:post).permit(:title, :content, :image, :remove_image)
  end
end
