class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city_name, :address, :building_name, :tell_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city_name
    validates :address
    validates :tell_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}
  end

  def save(user_id,params)
    order = Order.create(user_id: user_id, item_id: params[:item_id].to_i)
    Address.create(post_code: post_code,prefecture: prefecture_id, city_name: city_name, address: address, building_name: building_name, tell_number: tell_number, order_id: order.id)
  end
end

