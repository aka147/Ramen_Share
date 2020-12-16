class Raman < ApplicationRecord
  # 必ずユーザーに紐づく
  belongs_to :user
  attachment :image
end
