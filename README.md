# テーブル設計

## users テーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| nickname                | string | null: false |
| email                   | string | null: false, unique: true |
| encrypted_password      | string | null: false |
| family_name             | string | null: false |
| first_name              | string | null: false |
| family_name_kana        | string | null: false |
| first_name_kana         | string | null: false |
| birthday                | date   | null: false |
## Association
- has_many : items
- has_many : orders


## items テーブル

| Column                  | Type       | Options     |
| ----------------------- | -----------| ----------- |
| user                    | references | null: false, foreign_key: true |
| item_name               | string     | null: false |
| item_price              | integer    | null: false |
| item_detail             | text       | null: false |
| category_id             | integer    | null: false |
| product_condition_id    | integer    | null: false |
## Association
- belongs_to : user
- has_one : order

## orders テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| user                    | references | null: false, foreign_key: true |
| items                   | references | null: false, foreign_key: true |
## Association
- belongs_to : user
- belongs_to : item
- belongs_to : address

## addresses テーブル

| Column                  | Type       | Options     |
| ----------------------- | -----------| ----------- |
| user                    | integer    | null: false, foreign_key: true |
| name                    | string     | null: false |
| post_code               | string     | null: false |
| prefecture_id           | integer    | null: false |
| city_name               | string     | null: false |
| address                 | string     | null: false |
| building_name           | string     | null: false |
| tell_number             | string     | null: false |
## Association
- belongs_to : order