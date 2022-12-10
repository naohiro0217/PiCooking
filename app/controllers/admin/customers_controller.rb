class Admin::CustomersController < ApplicationController
  # before_action :authenticate_admin!
  def index
    @customers = Customer.all
    @customer = Customer.find(params[:id])
  end

  def show
  end

  def edit
  end

  def update
  end

  def customer_params
    params.require(:customer).permit(:name, :nickname, :email, :is_deleted, :profile_image)
  end
end
