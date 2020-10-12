# テーブル設計

## users テーブル
| Column      | Type   | Options     |
| ----------  | ------ | ----------- |
| nick-name   | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| first-name1 | string | null: false |
| last-name1  | string | null: false |
| first-name2 | string | null: false |
| last-name2  | string | null: false |
| birthday    | date   | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchases


## items テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| category   | integer    | null: false                    |
| price      | integer    | null: false                    |
| condition  | integer    | null: false                    |
| shipping   | integer    | null: false                    |
| prefecture | integer    | null: false                    |
| day        | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments


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
| postal-code      | string     | null: false                    |
| prefecture       | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building-name    | string     | null: false                    |
| phone-number     | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## orders テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item-number      | string     | null: false                    |
| day              | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| purchase         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchases