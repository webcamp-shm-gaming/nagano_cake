class CartItem < ApplicationRecord
  # itemsテーブルとcart_itemsテーブルは1:Nの関係
  belongs_to :item
  belongs_to :customer
end
