class HomeController < ApplicationController
  def index
    @favorites_ranks = Noodle.find(Favorite.group(:noodle_id).reorder('count(noodle_id) desc').limit(3).pluck(:noodle_id))
    @reviews_ranks = Noodle.find(Review.group(:noodle_id).reorder('count(noodle_id) desc').limit(3).pluck(:noodle_id))

    #@scores_ranks = Noodle.find(Review.select("noodle_id,ROUND(AVG(score),1) as score").group(:noodle_id).reorder('score DESC').limit(3).pluck(:noodle_id))

    noodles = Noodle.all
    h = {}
    noodles.map{|v| h[v.avg_score] = v}
    # トップページに上位3件のみ表示させるため配列の前から三つだけ取得
    @scores_ranks = h.sort.reverse.map{|v| v[1]}[0..2]
  end
end
