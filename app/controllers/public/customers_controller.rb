class Public::CustomersController < ApplicationController
  # before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @cooks = @customer.cooks
    @cook = Cook.new
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

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :introduction)
  end



end