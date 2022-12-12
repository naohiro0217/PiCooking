class Public::CustomersController < ApplicationController
  # before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
    @cooks = @customer.cooks
    @cook = Cook.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render 'edit'
    end
  end

  def quit
  end

  def out
  end

  def index
    @customers = Customer.all
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image, :introduction)
  end



end
