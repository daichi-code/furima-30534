class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image


  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_id, presence: true
  validates :prefecture_id, presence: true
  validates :day_id, presence: true
  validates :image, presence: true

  validates :price, :numericality => { :greater_than_or_equal_to => 300 }
  validates :price, :numericality => { :less_than_or_equal_to => 9999999 }


  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price
  end
end
