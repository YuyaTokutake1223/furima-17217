require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  shared_examples '無効な場合' do |attribute, message|
    it "#{attribute}が無効である場合" do
      @user[attribute] = ''
      @user.valid?
      expect(@user.errors.full_messages).to include(message)
    end
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it_behaves_like '無効な場合', :nickname, "Nickname can't be blank"
      it_behaves_like '無効な場合', :email, "Email can't be blank"
      it_behaves_like '無効な場合', :last_name, "Last name can't be blank"
      it_behaves_like '無効な場合', :first_name, "First name can't be blank"
      it_behaves_like '無効な場合', :last_name_furigana, "Last name furigana can't be blank"
      it_behaves_like '無効な場合', :first_name_furigana, "First name furigana can't be blank"
      it_behaves_like '無効な場合', :birthday, "Birthday can't be blank"

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが全角英数字では登録できない' do
        @user.password = 'ａａａａａ１'
        @user.password_confirmation = 'ａａａａａ１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "お名前(全角)の苗字が半角では登録できない" do
        @user.last_name = 'tokutake'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "お名前(全角)の名前が半角では登録できない" do
        @user.first_name = 'yuya'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "お名前カナ(全角)の苗字が全角カタカナでなければ登録できない" do
        @user.last_name_furigana = 'ﾄｸﾀｹ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana is invalid")
      end

      it "お名前カナ(全角)の名前が全角カタカナでなければ登録できない" do
        @user.first_name_furigana = 'ﾕｳﾔ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana is invalid")
      end
    end
  end
end
