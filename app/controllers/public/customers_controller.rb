class Public::CustomersController < ApplicationController
   before_action :authenticate_customer!
   before_action :ensure_guest_customer, only: [:edit]

  def show
    @customer = Customer.find(params[:id])
    @cooks = @customer.cooks.order(created_at: :DESC).page(params[:page])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "登録内容の変更を保存しました！"
      redirect_to customer_path(@customer.id)
    else
      render 'edit', notice: "登録内容の変更に失敗しました"
    end
  end

  def quit
    @customer = current_customer
  end

  def out
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "アカウントの退会を実行しました!　またのご利用を心からお待ちしております。"
  end

  def index
    @customers = Customer.where(is_deleted: false).order(created_at: :DESC).page(params[:page])
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :profile_image, :introduction)
  end

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.name == "guestuser"
      redirect_to customer_path(current_customer) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
