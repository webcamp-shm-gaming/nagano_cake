class Item < ApplicationRecord
  has_one_attached :image
　has_many :genres, dependent: :destroy
　belongs_to :cart_item_id
  def price
    (self.price * 1.10).round
  end
end
