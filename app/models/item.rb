class Item < ApplicationRecord
  has_one_attached :image
  # itemsテーブルとcart_itemsテーブルは1:Nの関係
  has_many :cart_items, dependent: :destroy
end
