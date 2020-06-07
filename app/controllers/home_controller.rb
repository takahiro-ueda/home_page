class HomeController < ApplicationController

  def index
    # @posts = Post.all
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
    # @posts = Post.includes(:user)
    # Categoryのデータベースのテーブルから一致するidを取得
    # @category = Category.where(params[:category_id]).page(params[:page]).per(5).order(created_at: :desc)
    # category_idと紐づく投稿を取得
    # @posts = @category.posts.order(created_at: :desc).all
    @categories = Category.all
  end

  def search
    @posts = Post.search(params[:keyword]) 
  end
end
