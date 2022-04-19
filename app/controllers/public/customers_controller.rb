class Public::CustomersController < ApplicationController
  def show
    @customer = current_user
  end

  def edit
    @customer = current_user
  end

  def unsubscribe
  end
end
