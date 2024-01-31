# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |

## items テーブル

| Column     | Type       | Options     |
| -----------| -----------| ----------- |
| user_id    | integer    | null: false, foreign_key: true |
| item_name  | string     | null: false |
| item_price | string     | null: false |
| item_detail| text       | null: false |
| category   | string     | null: false |
| product_condition| string |null: false|

## orders テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| user_id   | integer    | null: false, foreign_key: true |
| items_id  | integer    | null: false, foreign_key: true |
| pay_method| references | null: false, foreign_key: true |

## addresses テーブル

| Column     | Type       | Options     |
| -----------| -----------| ----------- |
| user_id    | integer    | null: false, foreign_key: true |
| name       | string     | null: false |
| post_code  | string     | null: false |
| address    | string     | null: false |
| tell_number| string     | null: false |



