# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | --------------------------|
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| family_name           | string | null: false               |
| first_name            | string | null: false               |
| family_name_kana      | string | null: false               |
| first_name_kana       | string | null: false               |
| date_of_birth　       | date   | null: false               |

### Association

- has_many :items

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | string     | null: false                    |
| category_id     | integer    | null: false                    |
| state_id        | integer    | null: false                    |
| price_id        | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
### Association

- belongs_to :user

## shippings テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ------------|
| postage_id      | integer    | null: false |
| sender_id       | integer    | null: false |
| shipping_date_id| integer    | null: false |

### Association

- belongs_to :item
- has_many :shipping_address

### Association

### shipping_address テーブル

| Column         | Type      | Options        |
| ---------------|-----------| ---------------|
| postal_cade_id | integer   | null: false    |
| prefecture_id  | integer   | null: false    |
| municipality   | string    | null: false    |
| address        | string    | null: false    |
| building_name  | string    |                |
| phone_number   | string    | null: false    |

### Association

- belongs_to :item
- belongs_to :shipping
