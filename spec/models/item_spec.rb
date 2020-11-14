require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'すべての項目が存在すれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'textが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'textが空では登録できないこと' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが半角数字でなければ登録できないこと' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-with number")
    end

    it 'priceが300以上でなければ登録できないこと' do
      @item.price = Faker::Number.between(from: 1, to:299)
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'priceが9999999以下でなければ登録できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it 'category_idが空では登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it 'status_idが空では登録できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end

    it 'shipping_fee_idが空では登録できないこと' do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee Select")
    end

    it 'prefecture_idが空では登録できないこと' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end

    it 'shipping_time_idが空では登録できないこと' do
      @item.shipping_time_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping time Select")
    end

    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

  end
end