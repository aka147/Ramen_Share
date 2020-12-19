class Noodle < ApplicationRecord
  belongs_to :user
  # 必ず複数形、記事が削除されたときにいいねも削除するためdestroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  attachment :image
  # 空で投稿できないようにする
  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
end
