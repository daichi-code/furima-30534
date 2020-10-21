require 'rails_helper'

RSpec.describe UserPurchases, type: :model do
  describe '#create' do
    before do
      @purchase = FactoryBot.build(:user_purchases)
    end

    it '全ての項目の入力が存在すれば購入できること' do
      expect(@purchase).to be_valid
    end

    it 'tokenが空では登録できない' do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空では登録できない' do
      @purchase.postal_code = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it '県が空では登録できない' do
      @purchase.prefecture_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Prefecture is not a number')
    end

    it '市町村が空では登録できない' do
      @purchase.municipalities = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Municipalities can't be blank")
    end

    it '住所が空では登録できない' do
      @purchase.address = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空では登録できない' do
      @purchase.phone_number = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it '郵便番号に(-)が入っていないと登録できない' do
      @purchase.postal_code = '1234567'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Postal code is invalid')
    end

    it '郵便番号が上が3桁でないと登録できない' do
      @purchase.postal_code = '12-4567'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Postal code is invalid')
    end

    it '郵便番号が下が4桁でないと登録できない' do
      @purchase.postal_code = '123-567'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Postal code is invalid')
    end

    it '電話番号が9桁以下だと登録できない' do
      @purchase.phone_number = '123456789'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号が12桁以上だと登録できない' do
      @purchase.phone_number = '123456789012'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
