class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])

    if params[:order][:order_status] == "kakuninn"
      @order.update(order_params)
      @order_details = @order.order_details
      @order_details.update(create_status: 1)
    end
    if @order.update(order_params)
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end

private

    def order_params
      params.require(:order).permit(:pay_type, :delivery_post_code, :delivery_address, :delivery_name, :bill, :postage, :order_status )
    end

end
