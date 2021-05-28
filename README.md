# テーブル設計

## usersテーブル

| Colum                  | Type   | Options                   |
| ---------------------- | ------ | ------------------------- |
| n_name                 | string | null: false               |
| email                  | string | null: false, unique: true |
| encrypted_password     | string | null: false               |
| first_name             | string | null: false               |
| last_name              | string | null: false               |
| first_name kana        | string | null: false               |
| last_name kana         | string | null: false               |
| birthday               | date   | null: false               |

### Association

- has_many :products
- has_many :purchase historys

## productsテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping charge_id | integer    | null: false                    |
| shipping area_id   | integer    | null: false                    |
| day to ship_id     | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :purchase history
- belongs_to :user

## purchase historysテーブル

| Colum   | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :postal code

## postal codesテーブル

| Colum            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal code      | string     | null: false                    |
| prefectures      | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building name    | string     |                                |
| tel              | string     | null: false                    |
| purchase history | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase history