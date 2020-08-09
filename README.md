#  テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | -----  | ------------|
| name     | string | null: false |
| e-mail   | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, though: room_users
- has_many :messages

## rooms テーブル

| Column   | Type   | Options     |
| name     | string | null: false |

### Association

- has_many :room_users
- has_many : users, though: room_users
- has_many : messages

## room_users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user