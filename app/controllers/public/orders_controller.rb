class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    #@delivery =
    @customer = Customer.find(params[:id])
  end

  def confirm

  end

  def index
  end

  def show
  end

  def complete
  end
end
