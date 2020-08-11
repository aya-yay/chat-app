class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users

  validates :name, presemce: true
  # 　　　　　　↑ルーム名のこと
end

# 1つのチャットルームには、2人のユーザーが存在します。