require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての項目の入力が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'family_name1がない場合は登録できないこと' do
      @user.first_name1 = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name1 can't be blank")
    end

    it 'last_name1がない場合は登録できないこと' do
      @user.last_name1 = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name1 can't be blank")
    end

    it 'first_name2がない場合は登録できないこと' do
      @user.first_name2 = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name2 can't be blank")
    end

    it 'last_name2がない場合は登録できないこと' do
      @user.last_name2 = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name2 can't be blank")
    end

    it 'birth_dayがない場合は登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'sample1'
      @user.password_confirmation = 'sample1'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが英字のみだと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが数字のみだと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が含まれていないと登録できない' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'first_name1が全角入力でなければ登録できないこと' do
      @user.first_name1 = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name1 is invalid')
    end

    it 'last_name1が全角入力でなければ登録できないこと' do
      @user.last_name2 = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name2 is invalid')
    end

    it 'first_name2が全角カタカナでなければ登録できないこと' do
      @user.first_name2 = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name2 is invalid')
    end

    it 'last_name2が全角カタカナでなければ登録できないこと' do
      @user.last_name2 = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name2 is invalid')
    end
  end
end
