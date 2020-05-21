class HomeController < ApplicationController
  # before_action :set_post, only: :index

  def index
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
    # @posts= Post.order(created_at: :desc).page(params[:page]).per(10)
    # @likes = Like.where(user_id: current_user)
    # urlにcategory_id(params)がある場合
    # if params[:category_id]
    #   # # 投稿すべてを取得
    #   # @posts = Post.order(created_at: :desc).all

    #   # Categoryのデータベースのテーブルから一致するidを取得
    #   @category = Category.where(params[:category_id])
    #   # category_idと紐づく投稿を取得
    #   @posts = @category.posts.order(created_at: :desc).all
    # else
    #   # 投稿すべてを取得
    #   @posts = Post.order(created_at: :desc).all

      # # Categoryのデータベースのテーブルから一致するidを取得
      # @category = Category.find_by(id: params[:id])
      # # category_idと紐づく投稿を取得
      # @posts = @category.posts.order(created_at: :desc).all
      # @posts = @category.posts.find('category LIKE ?', "%#{params[:search]}%").all
      # # @posts = Post.where(id: @posts.category_id)
      # # @category = @posts.category_id
    # end

    def search
      @posts = Post.search(params[:search])
    end
  end
end
