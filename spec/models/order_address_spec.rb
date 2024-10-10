require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  shared_examples '無効な場合' do |attribute, message|
    it "#{attribute}が無効である場合" do
      @order_address.send("#{attribute}=", '')
      expect(@order_address).to_not be_valid
      expect(@order_address.errors.full_messages).to include(message)
    end
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it "すべての値が正しく入力されていれば保存できる" do
        expect(@order_address).to be_valid
      end

      it "building_nameはなくても保存できる" do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '新規登録できない場合' do
      it_behaves_like '無効な場合', :postal_code,       "Postal code can't be blank"
      it_behaves_like '無効な場合', :prefecture_id,     "Prefecture can't be blank"
      it_behaves_like '無効な場合', :city_town_village, "City town village can't be blank"
      it_behaves_like '無効な場合', :street_address,    "Street address can't be blank"
      it_behaves_like '無効な場合', :contact_number,    "Contact number can't be blank"
      it_behaves_like '無効な場合', :token,             "Token can't be blank"
      it_behaves_like '無効な場合', :user_id,           "User can't be blank"
      it_behaves_like '無効な場合', :item_id,           "Item can't be blank"
      it_behaves_like '無効な場合', :price,             "Price can't be blank"

      it "postal_code がハイフン無しだと保存できない" do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      
      it "prefecture_id が 1 だと保存できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "contact_number がハイフンありだと保存できない" do
        @order_address.contact_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Contact number is invalid")
      end

      it "contact_number が9桁以下だと保存できない" do
        @order_address.contact_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Contact number is invalid")
      end

      it "contact_number が12桁以上だと保存できない" do
        @order_address.contact_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Contact number is invalid")
      end
      
    end
  end
end




 