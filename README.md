# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| full_name          | string | null: false |
| full_name_furigana | string | null: false |
| birth_date         | string | null: false |

### Association

- has_many :products
- has_many :comments
- has_one  :address


##  products テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| product_name           | string     | null: false |
| description            | text       | null: false |
| categories             | string     | null: false |
| condition              | string     | null: false |
| shipping_cost          | string     | null: false |
| shipping_origin_region | string     | null: false |
| shipping_duration      | string     | null: false |
| sales_price            | integer    | null: false |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments


## comments テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| content | text       | null: false |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product


##  addresses テーブル

| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| postal_code       | string     | null: false |
| prefecture        | string     | null: false |
| city_town_village | string     | null: false |
| street_address    | string     | null: false |
| building_name     | string     |
| contact_number    | string     | null: false |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user