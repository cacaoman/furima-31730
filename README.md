# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| coufirmation_password | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false |
| first_name_kana       | string | null: false |

### Association

- has_many :items
- has_many :cards

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
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

## cades テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| cade_number    | string     | null: false                    |
| effective_date | string     | null: false                    |
| security_cade  | string     | null: false                    |
| user           | references | null: false, foreign_key: true |


### Association

- belongs_to :user

### Association

### shipping_address テーブル

| Column       | Type      | Options        |
| -------------|-----------| ---------------|
| postal_cade  | string    | null: false    |
| prefecture   | string    | null: false    |
| municipality | string    | null: false    |
| address      | string    | null: false    |
| building_name| string    | null: false    |
| phone_number | string    | null: false    |

### Association

- belongs_to :item
