require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  shared_examples '無効な場合' do |attribute, message|
    it "#{attribute}が無効である場合" do
      @item[attribute] = ''
      @item.valid?
      expect(@item.errors.full_messages).to include(message)
    end
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it "image, item_name, description, category_id, condition_id, shipping_cost_id, prefecture_id, shipping_duration_id, sales_priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '新規登録できない場合' do
      it_behaves_like '無効な場合', :item_name,            "Item name can't be blank"
      it_behaves_like '無効な場合', :description,          "Description can't be blank"
      it_behaves_like '無効な場合', :category_id,          "Category can't be blank"
      it_behaves_like '無効な場合', :condition_id,         "Condition can't be blank"
      it_behaves_like '無効な場合', :shipping_cost_id,     "Shipping cost can't be blank"
      it_behaves_like '無効な場合', :prefecture_id,        "Prefecture can't be blank"
      it_behaves_like '無効な場合', :shipping_duration_id, "Shipping duration can't be blank"
      it_behaves_like '無効な場合', :sales_price,          "Sales price is not a number"

      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '価格が全角数字では登録できない' do
        @item.sales_price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales price is not a number")
      end

      it '価格が300円未満では登録できない' do
        @item.sales_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales price must be greater than or equal to 300")
      end

      it '価格が10,000,000円未満では登録できない' do
        @item.sales_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales price must be less than or equal to 9999999")
      end
    end
  end

end