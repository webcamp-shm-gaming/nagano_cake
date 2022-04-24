class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true


  def with_tax_price

   (price * 1.10).floor
  end
end
