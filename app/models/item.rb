class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :order_details
  belongs_to :genre

  validates :image, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :is_active, inclusion: { in: [true, false] }

  has_one_attached :image


  def with_tax_price
    (price * 1.1).floor
  end
end
