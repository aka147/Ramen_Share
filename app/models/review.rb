class Review < ApplicationRecord
  belongs_to :user
  belongs_to :noodle
  validates :score, presence: true
  default_scope -> { order(created_at: :desc) }
end
