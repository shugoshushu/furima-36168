# DB設計

## usersテーブル

| Colum              | Type    | Option      |
| ---------------    | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null; false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| kana_first_name    | string  | null: false |
| kana_last_name     | string  | null: false |
| birthday           | date    | null: false |

- has_many :products
- has_many :purchases

## productsテーブル

| Colum           | Type      | Option      |
| --------------  | -----     | ----------- |
| product_name    | string    | null: false |
| product_explain | text      | null: false |
| category_id     | integer   | null: false |
| condition_id    | integer   | null: false |
| fee_load_id     | integer   | null: false |
| send_from_id    | integer   | null: false |
| send_by_id      | integer   | null: false |
| price           | integer   | null: false |
| user            | reference | null: false, foreign_key: true |

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Colum   | Type      | Option      |
| ------- | --------- | ----------- |
| user    | reference | null: false, foreign_key: true |
| product | reference | null: false, foreign_key: true |

- has_one :address
- belongs_to :user

## addressesテーブル

| Colum         | Type      | Option |
| ------------- | --------- | ------ |
| post_code     | string    | null: false |
| prefecture_id | integer   | null: false |
| city          | string    | null: false |
| address       | string    | null: false |
| building_nama | string    |
| number        | string    | null: false |
| purchase      | reference | null: false, foreign_key: true |
