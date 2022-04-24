class Genre < ApplicationRecord
  has_many :items

  validates :name, presence: true
  validates :item_id, presence: true
end
