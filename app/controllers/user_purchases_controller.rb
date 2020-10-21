class UserPurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: [:index]

  def index
    @order = UserPurchases.new
  end

  def create
    @order = UserPurchases.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:user_purchases).permit(:token, :postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end
end
