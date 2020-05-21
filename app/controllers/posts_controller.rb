class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category_id]
      # Categoryのデータベースのテーブルから一致するidを取得
      @category = Category.find(params[:category_id])
      # category_idと紐づく投稿を取得
      # post = @categories.posts
      @posts = @category.posts.order(created_at: :desc).all
    else
      # 投稿すべてを取得
      @posts = Post.order(created_at: :desc).all
    end
    @posts = Post.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
    @likes = Like.where(user_id: current_user)
  end

  def show
    @like = 0
    @likes = Like.where(post_id: params[:id])
    @comment = Comment.new
    #新着順で表示
    @comments = @post.comments.includes(:user)#.order(created_at: :desc)
    @category = @post.category_id
  end

  def new
    @post = Post.new
    @post.post_categories.build
  end

  def edit
  end

  def create
    category = Category.find(post_params[:category_id])
    @post = category.posts.create(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '投稿が作成されました。' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if category = @post.categories.update(post_params[:category_id])
        format.html { redirect_to @post, notice: '投稿が更新されました。' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: '削除に成功しました。' }
      format.json { head :no_content }
    end
  end

  def category
    Category.find(params[:category_id])
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @posts = Post.search(params[:search])
  end

  private
    # コールバックを使用して、アクション間で共通の設定または制約を共有します。
    def set_post
      @post = Post.find(params[:id])
    end

    # 信頼できるパラメータのリストのみを許可します。
    def post_params
      params.require(:post).permit(:title, :content, :image, :category_id).merge(user_id: current_user.id)
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
