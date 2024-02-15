class OrdersController < ApplicationController
  before_action :non_purchased_item, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:post_code, :prefecture_id,:city_name, :address, :building_name, :tell_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_4cd9d67cb4b18b5685b76e3d"
    Payjp::Charge.create(
      amount: order_params[:item_price]
      card: order_params[:token]
      currency: 'jpy'
    )
  end

  def non_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path unless @item && (current_user.id != @item.user_id || !@item.orders.present?)
  end
end