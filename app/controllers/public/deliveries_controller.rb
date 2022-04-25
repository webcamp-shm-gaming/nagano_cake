class Public::DeliveriesController < ApplicationController

  def index
    @delivery = Delivery.new
    @deliveries = Delivery.all
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      flash[:notice] = "配達先情報を登録しました"
      redirect_to deliveries_path
    else
      flash[:notice] = "全て入力してください"
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
      flash[:notice] = "配達先情報を編集しました"
      redirect_to deliveries_path
    else
      render :edit
    end
  end

  def destroy
    delivery = Delivery.find(params[:id])
    flash[:notice] = "配送先情報を削除しました。"
    delivery.destroy
    redirect_to deliveries_path
  end

  private

  def delivery_params
    params.require(:delivery).permit(:customer_id, :post_code, :address, :address_name).merge(customer_id: current_customer.id)
  end

end
