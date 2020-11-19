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
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| state_id           | integer    | null: false                    |
| price              | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| time_to_ship_id    | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


### shipping_addresses テーブル

| Column         | Type      | Options                       |
| ---------------|-----------| ------------------------------|
| postal_cade    | string    | null: false                   |
| prefecture_id  | integer   | null: false                   |
| municipality   | string    | null: false                   |
| address        | string    | null: false                   |
| building_name  | string    |                               |
| phone_number   | string    | null: false                   |
| order          | references| null: false, foreign_key: true|

### Association

- belongs_to :order


### orders テーブル

| Column     | Type      | Options                       |
| -----------|-----------| ------------------------------|
| user       | references| null: false, foreign_key: true|
| item       | references| null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address