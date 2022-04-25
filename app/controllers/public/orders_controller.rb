class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @delivery = Delivery.new
  end

  def confirm
    @order = Order.new(order_params)
    if 0
      @order.delivery_post_code = current_customer.delivery_post_code
      @order.delivery_address = current_customer.delivery_address
      @order.delivery_name = current_customer.first_name + current_customer.last_name
    elsif 1
      @address = Address.find(params[:order][:address_id])
      @order.delivery_post_code = @address.delivery_post_code
      @order.delivery_address = @address.delivery_address
      @order.delivery_name = @address.delivery_name
    else 2
    end
  end

  def index
  end

  def show
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:pay_type, :delivery_post_code, :delivery_address, :delivery_name)
  end

end
