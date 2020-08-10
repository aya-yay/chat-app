class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
end

# 1つのチャットルームには、2人のユーザーが存在します。