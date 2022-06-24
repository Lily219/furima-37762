# テーブル設計


## users テーブル

| Column               | Type      | Options      |
|----------------------|-----------|--------------|
| nickname             | string    | null: false  | 
| email                | string    | null: false  |
| password             | string    | null: false  |
| encrypted_password   | string    | null: false  |
| first_name           | string    | null: false  |
| last_name            | string    | null: false  |
| first_name_kana      | string    | null: false  |
| last_name_kana       | string    | null: false  |
| birthday             | date      | null: false  |

### Association
- has_many :items
- has_many :comments 


## items テーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| title                | string      | null: false                    | 
| price                | integer     | null: false                    |
| user                 | references  | null: false, foreign_key: true |
| category             | string      | null: false                    |
| condition            | string      | null: false                    |
| delivery_fee         | string      | null: false                    |
| aria                 | string      | null: false                    |
| delivery_day         | date        | null: false                    |

### Association
- belongs_to :users
- has_many :comment


## commnets テーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| content              | text        | null: false                    | 
| user                 | references  | null: false, foreign_key: true |
| item                 | references  | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items


## pays テーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| card_num             | integer     | null: false                    | 
| exp_date             | integer     | null: false                    |
| security_num         | integer     | null: false                    |


### Association
- has_one :delivery_add


## delivery_add テーブル

| Column               | Type        | Options                        |
|----------------------|-------------|--------------------------------|
| postcord             | integer     | null: false                    | 
| prefectures          | storing     | null: false                    |
| municipality         | storing     | null: false                    |
| block_num            | integer     | null: false                    |
| buillding            | storing     |                                |
| phone_num            | integer     | null: false                    |


### Association
- belongs_to :pays