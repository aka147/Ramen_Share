class UsersController < ApplicationController
  # デバイスに入っているヘルパーメソッド。ログインしていない人のアクションへのアクセスを制限する。 [indexだけ許可という意味！]
  before_action :authenticate_user!, except: [:index]
  PER = 12
  def index
    @users = User.all.page(params[:page]).per(PER)
        # この記述ではない？  
    # @users = User.page(params[:page]).per(PER)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: "不正なアクセスです。"
    end
  end


  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
   redirect_to user_path(@user), notice: "マイページを編集しました。"
   else
     render :edit
   end
  end

  # *管理者ユーザー
  def destroy
    user = User.find_by(id: params[:id])
    if current_user.admin
      user.destroy
      flash[:notice] = "ユーザーを削除しました"
    end
    redirect_to users_path
  end

  private
  def user_params
  params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end