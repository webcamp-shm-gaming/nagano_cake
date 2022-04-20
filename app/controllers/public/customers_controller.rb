class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:updateu] = 'You have updated user successfully.'
      redirect_to customers_path(@customer.id)
    else
      render :edit
    end
  end

  def unsubscribe
  end

private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :address)
  end

end
