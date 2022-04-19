class Public::CustomersController < ApplicationController
  def show
    @customer = current_user
  end

  def edit
    @customer = current_user
  end

  def update
    @customer = current_user
    if @customer.update(customer_params)
      flash[:updateu] = 'You have updated user successfully.'
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

  def unsubscribe
  end
end
