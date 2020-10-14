class ItemsController < ApplicationController


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    #@item = Item.new(item_params)
  end




  private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :price, :condition_id, :shipping_id, :prefecture_id, :day_id, :image).merge(user_id: current_user.prefecture_id)
  end

end
