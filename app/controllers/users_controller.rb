class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params) #user_paramsはPOSTデータをチェックするメソッド
    if @user.save
      flash[:success] = '新しいユーザーを登録しました。'
      redirect_to action: :index
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @user
     
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        render :edit
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end   
     
    else
        redirect_to root_url
    end
  end

  def show
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(5)
  end

  def destroy
  end

  def profile
  end

  def overview
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end

    # def user_params
    #   params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :image, :introduce, :age, :sex, :address)
    # end
end
