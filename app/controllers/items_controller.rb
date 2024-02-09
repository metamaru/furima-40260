class ItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, atatus: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :category_id, :product_condition_id,
                                 :delivery_charge_id, :prefecture_id, :delivery_day_id, :item_price).merge(user_id: current_user.id)
  end
end
