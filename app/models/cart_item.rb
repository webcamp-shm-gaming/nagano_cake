class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer

  has_one_attached :image

  validates :customer_id, :item_id, :amount, presence: true

  def subtotal
    item.with_tax_price * amount
  end
end
