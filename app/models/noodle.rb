class Noodle < ApplicationRecord
  belongs_to :user
  attachment :image
  # 空で投稿できないようにする
  with_options presence: true do
    validates :title
    validates :body
    validates :image
  end
end
