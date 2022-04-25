class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @delivery = Delivery.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.delivery_post_code = current_customer.post_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @delivery = Delivery.find(params[:order][:delivery_id])
      @order.delivery_post_code = @delivery.post_code
      @order.delivery_address = @delivery.address
      @order.delivery_name = @delivery.address_name
    elsif params[:order][:select_address] == "2"
      @order.delivery_post_code = params[:order][:delivery_post_code]
      @order.delivery_address = params[:order][:delivery_address]
      @order.delivery_name = params[:order][:delivery_name]
    end
    @cart_items = current_customer.cart_items
  end

  # 購入を確定します
  def create # Order に情報を保存します
    cart_items = current_customer.cart_items.all
  # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
    @order = current_customer.orders.new(order_params)
  # 渡ってきた値を @order に入れます

    cart_items.each do |cart_item|
  # 取り出したカートアイテムの数繰り返します
  # order_detail にも一緒にデータを保存する必要があるのでここで保存します
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.amount = cart_item.amount
  # 購入が完了したらカート情報は削除するのでこちらに保存します
      order_detail.price = cart_item.item.price
  # カート情報を削除するので item との紐付けが切れる前に保存します
      order_detail.save
    end
    @order.save
    cart_items.destroy_all
  # ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
    redirect_to orders_complete_path

  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:pay_type, :delivery_post_code, :delivery_address, :delivery_name)
  end

end
