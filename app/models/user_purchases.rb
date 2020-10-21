class UserPurchases
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :phone_number, :building_name, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A^\d{3}[-]\d{4}$\z/ }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A^\d{10}$|^\d{11}$\z/ }
    validates :token
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Purchase.create(order_id: @order.id, postal_code: postal_code, prefecture: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number)
  end
end
