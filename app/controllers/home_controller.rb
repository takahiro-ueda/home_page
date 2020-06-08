class HomeController < ApplicationController

  def index
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
    # category_idと紐づく投稿を取得
    @categories = Category.all
  end

  def search
    @posts = Post.search(params[:keyword]) 
  end
end
