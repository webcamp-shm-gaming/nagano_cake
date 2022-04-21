class Public::DeliveriesController < ApplicationController

<<<<<<< HEAD

=======
>>>>>>> origin/develop
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
      @deliveries = Delivery.all
      render "index"
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
<<<<<<< HEAD
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to deliveries_path, notice: "配達先情報の更新に成功しました"
    else
      render :edit
    end
  end

=======
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

>>>>>>> origin/develop
  def destroy
    delivery = Delivery.find(params[:id])
    flash[:notice] = "配送先情報を削除しました。"
    delivery.destroy
    redirect_to deliveries_path
  end

<<<<<<< HEAD
  private

	def delivery_params
   params.require(:delivery).permit(:customer_id, :post_code, :address, :address_name).merge(customer_id: current_customer.id)
=======
private

  def delivery_params
    params.require(:delivery).permit(:customer_id, :post_code, :address, :address_name).merge(customer_id: current_customer.id)
>>>>>>> origin/develop
  end

end
