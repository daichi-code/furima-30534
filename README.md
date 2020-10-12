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
| title      | string     | null: false, foreign_key: true |
| text       | text       | null: false, foreign_key: true |
| price      | integer    | null: false, foreign_key: true |
| condition  | decimal    | null: false, foreign_key: true |
| shipping   | decimal    | null: false, foreign_key: true |
| prefecture | decimal    | null: false, foreign_key: true |
| day        | date       | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments


## comments テーブル
| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| text      | text       | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item


## purchases テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card-number      | integer    | null: false, foreign_key: true |
| expiration-month | integer    | null: false, foreign_key: true |
| expiration-day   | integer    | null: false, foreign_key: true |
| security-code    | integer    | null: false, foreign_key: true |
| postal-code      | integer    | null: false, foreign_key: true |
| prefecture       | decimal    | null: false, foreign_key: true |
| municipalities   | string     | null: false, foreign_key: true |
| address          | string     | null: false, foreign_key: true |
| building-name    | string     | null: false, foreign_key: true |
| phone-number     | integer    | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user