class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genres



  def add_tax_price
   (se.price * 1.10).round
  end
end
