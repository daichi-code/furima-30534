class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  def edit
    @item = Item.find(params[:id])
  end



  private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :price, :condition_id, :shipping_id, :prefecture_id, :day_id, :image).merge(user_id: current_user.prefecture_id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to action: :index
    end
  end

end
