class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string  :content
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

# テキストの内容：「content」カラム
# メッセージの投稿をしたチャットルームのid：「room_id」カラム
# メッセージの投稿をしたユーザーのid：「user_id」カラム
# room_idとuser_idは、roomsテーブルとusersテーブルのidが主キーであり、messagesテーブルと関連性を持つ場合に必要なカラムです。

# そのidで判別できるレコードに関連付けを行う場合に使用するものが、外部キー制約です。
# roomとuserには、foreign_key: trueの制約をつけましょう。こちらの制約は外部キー（今回であればroom_idとuser_id）の存在をDBに保存する上での必須条件とすることができます。
# もし、この制約をつけなかった場合、関連性を持つテーブルのレコードに意図しない
# 値が保存されてしまう可能性があり、エラーが発生します。