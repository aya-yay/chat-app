class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  # 　　　　　　↑ルーム名のこと
end

# 1つのチャットルームには、2人のユーザーが存在します。