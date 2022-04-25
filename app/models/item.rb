class Item < ApplicationRecord
  has_one_attached :image
  # itemsテーブルとcart_itemsテーブルは1:Nの関係
  has_many :cart_items, dependent: :destroy

<<<<<<< HEAD
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
=======
  belongs_to :genre

  validates :price, presence: true
>>>>>>> develop

  # 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
end
