# テーブル設計


## users テーブル

| Column               | Type      | Options                    |
|----------------------|-----------|----------------------------|
| nickname             | string    | null: false                | 
| email                | string    | null: false, unique: true  |
| encrypted_password   | string    | null: false                |
| first_name           | string    | null: false                |
| last_name            | string    | null: false                |
| first_name_kana      | string    | null: false                |
| last_name_kana       | string    | null: false                |
| birthday             | date      | null: false                |

### Association
- has_many :items 
- belongs_to :order


## items テーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| title                | string      | null: false                    | 
| price                | integer     | null: false                    |
| user                 | references  | null: false, foreign_key: true |
| category_id          | integer     | null: false                    |
| condition_id         | integer     | null: false                    |
| delivery_fee_id      | integer     | null: false                    |
| aria_id              | integer     | null: false                    |
| delivery_day_id      | integer     | null: false                    |
| description          | text        | null: false                    |

### Association
- belongs_to :user
- belongs_to :order

## orders テーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| user                 | references  | null: false, foreign_key: true |
| item                 | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :addresses




## addresses テーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| postcord             | string      | null: false, foreign_key: true                     | 
| aria_id              | integer     | null: false, foreign_key: true                     |
| municipality         | string      | null: false, foreign_key: true                     |
| block_num            | string      | null: false, foreign_key: true                     |
| building             | string      |foreign_key: true                                   |
| phone_num            | string      | null: false, foreign_key: true                     |


### Association
- belongs_to :order