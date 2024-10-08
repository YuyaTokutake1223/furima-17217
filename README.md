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

- has_many :items
- has_many :orders


##  items テーブル

| Column                    | Type       | Options     |
| ------------------------- | ---------- | ----------- |
| item_name                 | string     | null: false |
| description               | text       | null: false |
| category_id               | integer    | null: false |
| condition_id              | integer    | null: false |
| shipping_cost_id          | integer    | null: false |
| prefecture_id             | integer    | null: false |
| shipping_duration_id      | integer    | null: false |
| sales_price               | integer    | null: false |
| user                      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| item    | references | null: true,  foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
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
| orders              | references | null: false, foreign_key: true |

### Association

- belongs_to :order
