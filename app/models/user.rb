class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :noodles, dependent: :destroy

    # 空で投稿できないようにする
    validates :username, presence: true
    # 必ず複数形、記事が削除されたときにいいねも削除するためdestroy
    has_many :favorites, dependent: :destroy
    
    def already_favorited?(noodle)
      # セルフにはカレントユーザーが入る。noodle_idがいいねしようとしているnoodle_idがあるかを判定
    self.favorites.exists?(noodle_id: noodle.id)
    end
end
