class Admin::CustomersController < ApplicationController
  # before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def customer_params
    params.require(:customer).permit(:name, :nickname, :email, :is_deleted, :profile_image)
  end
end
