class Order < ApplicationRecord
  enum pay_type: { credit_card: 0, transfer: 1 }
  enum order_status: { machi: 0, kakuninn: 1, seisaku: 2, junbi: 3, hasso: 4 }

  belongs_to :customer
  has_many :order_details

  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price * amount
  end
end
