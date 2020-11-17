class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code, numericality: {with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :address
    validates :phone_number, numericality: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "Input only number"}
  end

  def save
    ShippngAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end