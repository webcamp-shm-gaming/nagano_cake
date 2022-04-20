class Public::DeliveriesController < ApplicationController


  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      flash[:notice] = "配達先情報を登録しました"
      redirect_to public_deliveries_path
    else
      @deliveries = Delivery.all
      render "index"
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to public_deliveries_path, notice: "配達先情報の更新に成功しました"
    else
      render :edit
    end
  end

  def destroy
    delivery = Delivery.find(params[:id])
    flash[:notice] = "配送先情報を削除しました。"
    delivery.destroy
    redirect_to public_deliveries_path
  end

  private

	def delivery_params
   params.require(:delivery).permit(:customer_id, :post_code, :address, :address_name).merge(customer_id: current_customer.id)
  end
end
