class Item < ApplicationRecord
  has_one_attached :image
　has_many :genre_id
  def price
    (self.price * 1.08).round
  end
end
