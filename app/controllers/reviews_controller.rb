class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index], only: [:show]
  def index
    @noodle = Noodle.find(params[:noodle_id])
    @reviews = @noodle.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to noodle_reviews_path(@review.noodle)
    else
      @noodle = Noodle.find(params[:noodle_id])
      render "noodles/show"
    end
  end

  def edit
    @review = Review.find(params[:id])
    if @review.user != current_user
      redirect_to noodle_reviews_path, alert: "不正なアクセスです。"
    end
  end

  private
  def review_params
    params.require(:review).permit(:noodle_id, :score, :content)
  end
end
