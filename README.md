# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| last_name_furigana  | string | null: false |
| first_name          | string | null: false |
| first_name_furigana | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :products
- has_many :purchase_records


##  products テーブル

| Column                    | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| product_name              | string     | null: false |
| description               | text       | null: false |
| categories_id             | integer    | null: false |
| condition_id              | integer    | null: false |
| shipping_cost_id          | integer    | null: false |
| shipping_origin_region_id | integer    | null: false |
| shipping_duration_id      | integer    | null: false |
| sales_price               | integer    | null: false |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_record


## purchase_records テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| product_id | references | null: true,  foreign_key: true |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :address


##  addresses テーブル

| Column              | Type       | Options     |
| ------------------  | ---------- | ----------- |
| postal_code         | string     | null: false |
| prefecture_id       | integer    | null: false |
| city_town_village   | string     | null: false |
| street_address      | string     | null: false |
| building_name       | string     |
| contact_number      | string     | null: false |
| purchase_records_id | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record
