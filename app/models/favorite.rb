class Favorite < ApplicationRecord
  # 必ず単数形、　いいねから矢印をユーザーとヌードルに伸ばすことができた
  belongs_to :user
  belongs_to :noodle
  # いいねは一つの投稿に対して一つまで
  validates_uniqueness_of :noodle_id, scope: :user_id
end
