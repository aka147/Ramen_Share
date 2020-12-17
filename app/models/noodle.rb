class Noodle < ApplicationRecord
  belongs_to :user
  attachment :image
end
