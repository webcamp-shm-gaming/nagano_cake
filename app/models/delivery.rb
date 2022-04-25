class Delivery < ApplicationRecord
  belongs_to :customer

  # 空白の投稿を全て弾く
  with_options presence: true do
    validates :post_code
    validates :address
    validates :address_name
    validates :customer_id
  end
end
