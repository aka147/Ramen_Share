class NoodlesController < ApplicationController
  def index
  end

  def show
    @noodle = Noodle.find(params[:id])
  end

  def new
    @noodle = Noodle.new
  end

  def create
    # データを新規登録するためのインスタンス作成
    @noodle = Noodle.new(noodle_params)
    #　誰が投稿したか
    @noodle.user_id = current_user.id
    # データをデータベースに保存するためのsaveメソッド実行
    @noodle.save
    #  トップ画面へリダイレクト
    redirect_to noodle_path(@noodle)
  end

  def edit
    @noodle = Noodle.find(params[:id])
  end

  def update
    @noodle = Noodle.find(params[:id])
    @noodle.update(noodle_params)
    redirect_to noodle_path(@noodle)
  end

  private
  def noodle_params
    params.require(:noodle).permit(:title, :body, :image)
  end

end
