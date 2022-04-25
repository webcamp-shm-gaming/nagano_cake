class Order < ApplicationRecord
  enum pay_type: { credit_card: 0, transfer: 1 }
end
