# テーブル設計

## users テーブル
| Column      | Type   | Options     |
| ----------  | ------ | ----------- |
| nick_name   | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| first_name1 | string | null: false |
| last_name1  | string | null: false |
| first_name2 | string | null: false |
| last_name2  | string | null: false |
| birthday    | date   | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :orders


## items テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| text          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| price         | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| shipping_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :order


## comments テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## purchases テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association
- belongs_to :order


## orders テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- belongs_to :item