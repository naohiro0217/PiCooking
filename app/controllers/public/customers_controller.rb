class Public::CustomersController < ApplicationController
  # before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @cooks = @customer.cooks
  end

  def edit
  end

  def update
  end

  def quit
  end

  def out
  end

  def index
  end
  
  

end
