class Noodle < ApplicationRecord
  belongs_to :user
  # 必ず複数形、記事が削除されたときにいいねも削除するためdestroy
  attachment :image
  # 空で投稿できないようにする
  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
  #default_scope -> { order(created_at: :desc) }
end
