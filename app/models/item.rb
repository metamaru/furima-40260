class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_detail
    validates :category_id
    validates :product_condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_day_id
    validates :item_price
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :product_condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  validates_numericality_of :item_price, only_integegr: true
  validates :item_price, numericality: { in: 300..9_999_999 }
end
