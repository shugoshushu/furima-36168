# DB設計

## usersテーブル

| Colum              | Type    | Option      |
| ---------------    | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, ユニーク制約 |
| encrypted_password | string  | null; false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| kana_first_name    | string  | null: false |
| kana_last_name     | string  | null: false |
| birth_year         | integer | null: false | 
| birth_month        | integer | null: false |
| birth_date         | integer | null: false |

- has_many :products
- has_many :purchases
- has_many :comments

## productsテーブル

| Colum           | Type      | Option      |
| --------------  | -----     | ----------- |
| product_name    | string    | null: false |
| product_explain | text      | null: false |
| category        | string    | null: false |
| condition       | string    | null: false |
| fee_load        | string    | null: false |
| send_from       | string    | null: false |
| send_by         | string    | null: false |
| price           | integer   | null: false |
| user            | reference | null: false, 外部キー |

- has_many :comments
- belongs_to :user
- has_one :purchase

## commentsテーブル

| Colum   | Type      | Option      |
| --------| --------- | ----------- |
| content | text      | null: false |
| user    | reference | null: false, 外部キー |
| product | reference | null: false, 外部キー |

- belongs_to :product
- belongs_to :user

## purchasesテーブル

| Colum   | Type      | Option      |
| ------- | --------- | ----------- |
| user    | reference | null: false |
| product | reference | null: false |

- has_one :send
- belongs_to :user

## sendsテーブル

| Colum    | Type      | Option |
| -------- | --------- | ------ |
| purchase | reference | null: false |
