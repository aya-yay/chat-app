<<<<<<< HEAD
# テーブル設計
=======
# README
>>>>>>> parent of 5e9f7bf... テーブル設計

This README would normally document whatever steps are necessary to get the
application up and running.

<<<<<<< HEAD
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
=======
Things you may want to cover:
>>>>>>> parent of 5e9f7bf... テーブル設計

* Ruby version

<<<<<<< HEAD
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
=======
* System dependencies
>>>>>>> parent of 5e9f7bf... テーブル設計

* Configuration

<<<<<<< HEAD
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
=======
* Database creation
>>>>>>> parent of 5e9f7bf... テーブル設計

* Database initialization

<<<<<<< HEAD
- has_many :room_users
- has_many :users, through: room_users
- has_many :messages
=======
* How to run the test suite
>>>>>>> parent of 5e9f7bf... テーブル設計

* Services (job queues, cache servers, search engines, etc.)

<<<<<<< HEAD
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
=======
* Deployment instructions

* ...
>>>>>>> parent of 5e9f7bf... テーブル設計
