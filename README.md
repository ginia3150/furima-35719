# テーブル設計

## usersテーブル

| Colum           | Type   | Options      |
| --------------- | ------ | ------------ |
| n_name          | string | null: false  |
| email           | string | unique: true |
| pass            | string | null: false  |
| pass con        | string | null: false  |
| first_name      | string | null: false  |
| last_name       | string | null: false  |
| first_name kana | string | null: false  |
| last_name kana  | string | null: false  |
| year            | string | null: false  |
| month           | string | null: false  |
| day             | string | null: false  |

### Association

- has_many :products
- has_many :purchase history

## productsテーブル

| Colum            | Type       | Options     |
| ---------------- | ---------- | ----------- |
| product_name     | string     | null: false |
| description      | text       | null: false |
| category         | string     | null: false |
| condition        | string     | null: false |
| shipping charges | string     | null: false |
| shipping area    | string     | null: false |
| day to ship      | string     | null: false |
| price            | string     | null: false |
| user             | references |             |

### Association

- has_one :purchase history
- belongs_to :products

## purchase historyテーブル

| Colum   | Type       | Options |
| ------- | ---------- | ------- |
| user    | references |         |
| product | references |         |

### Association

- belongs_to :users
- has_one :products
- has_one :postal codes

## postal codesテーブル

| Colum            | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal code      | string     | null: false |
| prefectures      | string     | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building name    | string     |             |
| tel              | string     | null: false |
| purchase history | references |             |

### Association

-has_one :purchase history