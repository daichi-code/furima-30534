class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping
  belongs_to_active_hash :prefecture

  belongs_to :user

  has_one_attached :image


  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :prefecture_id
    validates :day_id
    validates :image
  end


  validates :category_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }

  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price
  end
end
