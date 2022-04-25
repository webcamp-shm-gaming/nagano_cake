class CartItem < ApplicationRecord
<<<<<<< HEAD

=======
  # itemsテーブルとcart_itemsテーブルは1:Nの関係
  belongs_to :item
  belongs_to :customer

  # 小計を求めるメソッド
  def subtotal
    item.with_tax_price * amount
  end
>>>>>>> develop
end
