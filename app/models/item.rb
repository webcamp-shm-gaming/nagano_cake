class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre



  def with_tax_price

   (price * 1.10).floor
  end
end
