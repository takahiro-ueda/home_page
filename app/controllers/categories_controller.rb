class CategoriesController < ApplicationController

  def show
    # Categoryのデータベースのテーブルから一致するidを取得
    @category = Category.find(params[:id])
    # category_idと紐づく投稿を取得
    @posts = @category.posts.order(created_at: :desc).page(params[:page]).per(5)
  end

end
