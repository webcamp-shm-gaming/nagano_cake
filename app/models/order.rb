class Order < ApplicationRecord
  enum pay_type: { credit_card: 0, transfer: 1 }

  belongs_to :customer

  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price * amount
  end
end
