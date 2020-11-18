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
| date of birth　       | string | null: false               |

### Association

- has_many :items

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| description  | string     | null: false                    |
| category     | string     | null: false                    |
| state        | string     | null: false                    |
| price        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## shippings テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| postage       | string     | null: false |
| sender        | string     | null: false |
| shipping_date | string     | null: false |

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
