require 'rails_helper'

RSpec.describe HistoryCode, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @history_code = FactoryBot.build(:history_code, user_id: user.id, product_id: product.id)
    sleep 0.1
  end

  describe '#create' do
    context '購入可能' do
      it '全ての項目に問題がないとき' do
        expect(@history_code).to be_valid
      end
      it 'building_nameがからでも購入できる' do
        @history_code.building_name = ''
        expect(@history_code).to be_valid
      end
    end

    context '購入不可' do
      it 'postal_codeが空だと購入できない' do
        @history_code.postal_code = ''
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'shipping_area_idが空だと購入できない' do
        @history_code.shipping_area_id = ''
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include('Shipping area is not a number')
      end
      it 'cityが空だと購入できない' do
        @history_code.city = ''
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @history_code.address = ''
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空だと購入できない' do
        @history_code.tel = ''
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include("Tel can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @history_code.token = nil
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeにハイフンがないといけない' do
        @history_code.postal_code = '1231423'
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include('Postal code is invalid')
      end
      it 'telは12桁以上では登録できない' do
        @history_code.tel = '050123456789'
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include('Tel is invalid')
      end
      it 'telは9桁以下では登録できない' do
        @history_code.tel = '050123412'
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include('Tel is invalid')
      end
      it 'telは英字では登録できない' do
        @history_code.tel = 'hguroeuo'
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include('Tel is invalid')
      end
      it 'telは半角英数字混合では登録できない' do
        @history_code.tel = '0huodfs0'
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include('Tel is invalid')
      end
      it 'telは全角数字では登録できない' do
        @history_code.tel = '５４１７９８４０'
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include('Tel is invalid')
      end
      it 'telは全角英数字混合では登録できない' do
        @history_code.tel = '４３２ｇ７７７'
        @history_code.valid?
        expect(@history_code.errors.full_messages).to include('Tel is invalid')
      end
    end
  end
end
