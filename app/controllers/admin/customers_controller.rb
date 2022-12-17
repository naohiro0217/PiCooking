class Admin::CustomersController < ApplicationController
  # before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @cooks = @customer.cooks.order(created_at: :DESC)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "登録情報の変更を保存しました！"
    else
      render "edit", notice: "登録情報の変更に失敗しました"
    end
  end

  private
  # 管理者側は退会ステータスの変更のみ
  def customer_params
    params.require(:customer).permit(:is_deleted)
  end
end
