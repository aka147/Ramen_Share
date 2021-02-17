class FavoritesController < ApplicationController
  def  create
    @noodle = Noodle.find(params[:noodle_id])
    @favorite = current_user.favorites.create(noodle_id: params[:noodle_id])
  end

  def destroy
    @noodle = Noodle.find(params[:noodle_id])
    @favorite = current_user.favorites.find_by(noodle_id: @noodle.id)
    @favorite.destroy
  end
end