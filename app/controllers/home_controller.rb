class HomeController < ApplicationController
  def index
    @posts= Post.order(created_at: :desc).page(params[:page]).per(10)
    @likes = Like.where(user_id: current_user)
    if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
       
      # category_idと紐づく投稿を取得
      @posts = @category.all
    else
      # 投稿すべてを取得
      @posts = Post.all
    end
  end
end
