class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :item_detail
    validates :category_id
    validates :product_condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :item_price
  end
end
