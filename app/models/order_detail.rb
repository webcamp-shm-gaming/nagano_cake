class OrderDetail < ApplicationRecord
  enum create_status: { huka: 0, machi: 1, seisaku: 2, kanryo: 3 }

  belongs_to :order
  belongs_to :item

  def subtotal
    item.with_tax_price * amount
  end

end
