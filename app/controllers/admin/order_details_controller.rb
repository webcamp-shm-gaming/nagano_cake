class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])

    if params[:order_detail][:create_status] == "seisaku"
      @order_detail.update(order_detail_params)
      @order = @order_detail.order
      @order.update(order_status: 2)
    end
    if params[:order_detail][:create_status] == "kanryo"
      @order_detail.update(order_detail_params)
      @order = @order_detail.order
      order_detail_count = @order.order_details.count
      count = 0
      @order.order_details.each do |order_detail|
        if order_detail.create_status == "kanryo"
          count += 1
        end
      end
      if count == order_detail_count
      @order.update(order_status: 3)
      end
    end
    if @order_detail.update(order_detail_params)
      redirect_to admin_order_path(@order_detail.order)
    else
      render :show
    end
  end

  private

    def order_detail_params
      params.require(:order_detail).permit(:price, :amount, :create_status )
    end

end
