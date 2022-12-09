class Admin::CustomersController < ApplicationController
  # before_action :authenticate_admin!
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def customer_params
    params.require(:customer).permit(:name, :nickname, :email, :is_deleted)
  end
end
