class FavoritesController < ApplicationController
  def  create
    # ２つのカラムが保存されるのでいいね機能ができる
    @favorite = current_user.favorites.create(noodle_id: params[:noodle_id])
    # いいねをしたときに前の画面に戻るためのもの
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @noodle = Noodle.find(params[:noodle_id])
    # カレントユーザーにユーザーidが入っていて、noodle_idにヌードル_idが入っている
    @favorite = current_user.favorites.find_by(noodle_id: @noodle.id)
    redirect_back(fallback_location: root_path)
  end
end