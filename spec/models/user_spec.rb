require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@がないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = '123aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは半角英数字の混合ではないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'last_nameがないと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameがないと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaがないと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaがないと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthdayがないと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'last_nameは全角（漢字・ひらがな・カタカナ）ではないと登録できない' do
      @user.last_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）ではないと登録できない' do
      @user.first_name = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'last_name_kanaは全角（カタカナ）での入力ではないと登録できない' do
      @user.last_name_kana = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'first_name_kanaは全角（カタカナ）での入力ではないと登録できない' do
      @user.first_name_kana = 'kana'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
  end
end
