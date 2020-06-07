class HomeController < ApplicationController

  def index
    # @posts = Post.all
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
    # Categoryのデータベースのテーブルから一致するidを取得
    @category = Category.where(params[:category_id])
    # category_idと紐づく投稿を取得
    # @posts = @category.posts.order(created_at: :desc).all
    @categories = Category.all
  end

  def search
    @posts = Post.search(params[:keyword]) 
  end
end
