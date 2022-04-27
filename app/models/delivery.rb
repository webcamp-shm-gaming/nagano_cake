class Delivery < ApplicationRecord
  belongs_to :customer


  with_options presence: true do
    validates :post_code
    validates :address
    validates :address_name
    validates :customer_id
  end

  def delivery_display
    '〒' + post_code + ' ' + address + ' ' + address_name
  end

end
