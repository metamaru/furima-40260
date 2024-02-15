require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '配送先情報' do
    context '配送先情報が保存できるとき' do
      it '必要事項を全て過不足なく入力すると出品できる' do
        expect(@order_form).to be_valid
      end
      it '番地が空でも保存できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end
    context '配送先情報が保存できないとき' do
      it '郵便番号が空だと保存できない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」半角文字列でないと保存できない' do
        @order_form.post_code = '１２３４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が空だと保存できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @order_form.city_name = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City name can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_form.tell_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tell number can't be blank")
      end
      it '電話番号が9桁以下だと保存できない' do
        @order_form.tell_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tell number is invalid. Include hyphen(-)')
      end
      it '電話番号が12桁以上だと保存できない' do
        @order_form.tell_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tell number is invalid. Include hyphen(-)')
      end
      it 'userが紐づいていないと保存できない' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
