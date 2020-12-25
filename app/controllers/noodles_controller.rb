class NoodlesController < ApplicationController
  # デバイスに入っているヘルパーメソッド。ログインしていない人のアクションへのアクセスを制限する。 [indexだけ許可という意味！]
  before_action :authenticate_user!, except: [:index], only: [:show]
  PER = 8
  def index
    @noodles = Noodle.all.order(created_at: :desc).page(params[:page]).per(PER)
    # この記述ではない？
    # @noodles = Noodle.page(params[:page]).per(PER)

  end

  def show
    @noodle = Noodle.find(params[:id])
    @review = Review.new
  end

  def new
    @noodle = Noodle.new
  end

  def create
    # データを新規登録するためのインスタンス作成
    @noodle = Noodle.new(noodle_params)
    #誰が投稿したか
    @noodle.user_id = current_user.id
    # データをデータベースに保存するためのsaveメソッド実行
    if  @noodle.save
    #  トップ画面へリダイレクト
    redirect_to noodle_path(@noodle), notice: "投稿に成功しました。"
    else
      render :new
    end
  end

  def edit
    @noodle = Noodle.find(params[:id])
    if @noodle.user != current_user
      redirect_to noodle_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @noodle = Noodle.find(params[:id])
    if @noodle.update(noodle_params)
    redirect_to noodle_path(@noodle),notice: "更新に成功しました。"
    else
      render :edit
    end
  end


  def destroy
    noodle = Noodle.find(params[:id])
    if current_user.admin or current_user
    noodle.destroy
    flash[:notice] = "ラーメンを削除しました"
    end
    redirect_to noodles_path
  end

  def withdraw
    @noodle = current_user
  end

  private
  def noodle_params
    params.require(:noodle).permit(:title, :body, :image)
  end

end
