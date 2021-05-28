# テーブル設計

## usersテーブル

| Colum                  | Type   | Options                   |
| ---------------------- | ------ | ------------------------- |
| n_name                 | string | null: false               |
| email                  | string | null: false, unique: true |
| encrypted_password     | string | null: false               |
| first_name             | string | null: false               |
| last_name              | string | null: false               |
| first_name_kana        | string | null: false               |
| last_name_kana         | string | null: false               |
| birthday               | date   | null: false               |

### Association

- has_many :products
- has_many :purchase_historys

## productsテーブル

| Colum              | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_charge_id | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| day_to_ship_id     | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :purchase_history
- belongs_to :user

## purchase_historysテーブル

| Colum   | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :postal_code

## postal_codesテーブル

| Colum            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| tel              | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history