class Public::DeliveriesController < ApplicationController


  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      flash[:notice] = "配達先を登録しました"
      redirect_to public_deliveries_path
    else
      @deliveries = Delivery.all
      render "index"
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
	def delivery_params
  	params.require(:delivery).permit(:customer_id, :post_code, :address, :address_name)
  end
end
