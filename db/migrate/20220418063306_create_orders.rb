class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :delivery_post_code
      t.string :delivery_address
      t.string :delivery_name
      t.integer :postage
      t.integer :bill
      t.integer :pay_type
      t.integer :order_status
      t.timestamps
    end
  end
end
