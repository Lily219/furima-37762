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
- has_many :comments 


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
- has_many :comments


## orders テーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| user_id              | references  | null: false, foreign_key: true |
| item_id              | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_add




## delivery_adds テーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| postcord             | string      | null: false                    | 
| prefectures_id       | string      | null: false                    |
| municipality         | string      | null: false                    |
| block_num            | string      | null: false                    |
| building             | string      |                                |
| phone_num            | string      | null: false                    |


### Association
- belongs_to :order