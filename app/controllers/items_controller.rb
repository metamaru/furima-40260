class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :category_id, :product_condition, :delivery_charge_id, :prefecture_id, :delivery_day_id, :item_price).merge(user_id: current_user.id)
  end

end
