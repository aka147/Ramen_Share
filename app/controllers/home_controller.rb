class HomeController < ApplicationController
  def index
    @favorites_ranks = Noodle.find(Favorite.group(:noodle_id).reorder('count(noodle_id) desc').limit(3).pluck(:noodle_id))
    @reviews_ranks = Noodle.find(Review.group(:noodle_id).reorder('count(noodle_id) desc').limit(3).pluck(:noodle_id))
    @scores_ranks = Noodle.find(Review.select("noodle_id,ROUND(AVG(score),1) as score").group(:noodle_id).reorder('score DESC').limit(3).pluck(:noodle_id))
  end
end
