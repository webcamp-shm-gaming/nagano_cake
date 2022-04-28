class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :order_details
  belongs_to :genre

  validates :price, presence: true

  has_one_attached :image


  def with_tax_price
    (price * 1.1).floor
  end
end
