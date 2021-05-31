require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '#create' do

    context 'ユーザー登録できる' do
      it '全ての必須項目が条件通り入力されていると登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上で登録できる' do
        @user.password = '00o1Ki'
        @user.password_confirmation = '00o1Ki'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない' do
      it 'n_nameが空だと登録できない' do
        @user.n_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("N name can't be blank")
      end
      
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '0Kk00'
        @user.password_confirmation = '0Kk00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '半角英語のみでは登録できない' do
        @user.password = 'hhhhhh'
        @user.password_confirmation = 'hhhhhh'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it '半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it '全角英数混合では登録できない' do
        @user.password = '１２３４ｖｆ'
        @user.password_confirmation = '１２３４ｖｆ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '0Kk000'
        @user.password_confirmation = '0Kk0000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it '@が入っていないと登録できない' do
        @user.email = 'ww'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'last_nameが全角かな、カナ、漢以外では登録できない' do
        @user.last_name_kana = 'dD'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'first_nameが全角かな、カナ、漢以外では登録できない' do
        @user.first_name_kana = 'dD'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'last_name_kanaが全角カタカナ以外では登録できない' do
        @user.last_name_kana = 'だd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'first_name_kanaが全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'だd'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end
  end
end
