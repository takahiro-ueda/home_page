class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @post = Post.new
    @posts = Post.includes(:user).page(params[:page]).per(5).order(created_at: :desc)
    @likes = Like.where(user_id: current_user)
  end

  def show
    @like = 0
    @likes = Like.where(post_id: params[:id])
    @comment = Comment.new
    #新着順で表示
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @category = @post.category_id
  end

  def new
    @post = Post.new
    @post.post_categories.build
  end

  def edit
  end

  def create
    category = Category.find_by(params[:category_id])
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
    posts = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
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
    @posts = Post.search(params[:keyword])
    @posts = Post.includes(:user).page(params[:page]).per(5).order(created_at: :desc)
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

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
