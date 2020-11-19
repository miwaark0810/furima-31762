class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_time

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-with number' }
  validates :price, numericality: {
    greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range'
  }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_time_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
end
