require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '#create' do
    context '出品できる' do
      it '全ての必須項目が条件通り入力されていると登録できる' do
        expect(@product).to be_valid
      end
    end

    context '出品できない' do
      it '商品画像がないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明がないと出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが未選択だと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Category is not a number')
      end
      it '商品状態が未選択だと出品できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Condition is not a number')
      end
      it '配送料の負担が未選択だと出品できない' do
        @product.shipping_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping charge is not a number')
      end
      it '発送元地域が未選択だと出品できない' do
        @product.shipping_area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping area is not a number')
      end
      it '発送までの日数が未選択だと出品できない' do
        @product.day_to_ship_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Day to ship is not a number')
      end
      it '販売価格が未入力だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300円以下だと登録できない' do
        @product.price = '123'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が9999999円以上では登録できない' do
        @product.price = '1234567890'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格が半角数字意外だと登録できない' do
        @product.price = 'qnf１２９'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it 'カテゴリーが1以外でないと登録できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品状態が1以外でないと登録できない' do
        @product.condition_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Condition must be other than 1')
      end
      it '配送料の負担が1以外でないと登録できない' do
        @product.shipping_charge_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping charge must be other than 1')
      end
      it '発送元地域が1以外でないと登録できない' do
        @product.shipping_area_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it '発送までの日数が1以外でないと登録できない' do
        @product.day_to_ship_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Day to ship must be other than 1')
      end
    end
  end
end
