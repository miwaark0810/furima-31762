require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '配送先の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end

    it 'tokenが空だと保存できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end


    it 'postal_codeが空だと保存できないこと' do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code Input correctly")
    end

    it 'prefecture_idを選択していないと保存できないこと' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture Select")
    end

    it 'cityが空だと保存できないこと' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空だと保存できないこと' do
      @purchase_address.address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
    end

    it 'buildingは空でも保存できること' do
      @purchase_address.building = nil
      expect(@purchase_address).to be_valid
    end

    it 'phone_numberが空だと保存できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが半角のハイフンを含んだ形式では保存できないこと' do
      @purchase_address.phone_number = 012-345-789
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number Input only number")
    end

  end 
end
