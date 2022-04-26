class CartItem < ApplicationRecord
  # itemsテーブルとcart_itemsテーブルは1:Nの関係
  belongs_to :item
  belongs_to :customer

  has_one_attached :image

  validates :customer_id, :item_id, :amount, presence: true
  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price * amount
  end
end
