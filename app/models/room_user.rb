class RoomUser < ApplicationRecord
  belongs_to :room
  belongs_to :user
end

# どのユーザーがどのチャットルームに参加しているかを管理するのが、中間テーブルである「room_userテーブル」となります。