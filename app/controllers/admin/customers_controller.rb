class Admin::CustomersController < ApplicationController
  # before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @cooks = @customer.cooks
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customers_path(@customer)
    else
      render "edit"
    end
  end

  def customer_params
    params.require(:customer).permit(:is_deleted)
  end
end
