class Public::CooksController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_user, only: [:new, :create, :destroy, :update]

  def new
    @cook = Cook.new
  end

  def index
    @cooks = Cook.order(created_at: :DESC).page(params[:page])
    # 失敗
    # @customer = Customer.find(params[:id])
    # @cooks = Cook.@customer.where(is_deleted: false).order(created_at: :DESC).page(params[:page])
  end

  def show
    @cook = Cook.find(params[:id])
    @customer = @cook.customer
    @cook_comment = CookComment.new
  end

  def edit
    @cook = Cook.find(params[:id])
    @customer = @cook.customer
    if @customer == current_customer
      render :edit
    else
      redirect_to cooks_path
    end
  end

  def create
    @cook = Cook.new(cook_params)
    @cook.customer_id = current_customer.id
    if @cook.save
      redirect_to cooks_path, notice: "投稿に成功しました！"
    else
      render :new, notice: "投稿に失敗しました！"
    end
  end

  def update
    @cook = Cook.find(params[:id])
    if @cook.update(cook_params)
      redirect_to cook_path, notice: "投稿内容の変更を保存しました！！"
    else
      render :edit, notice: "投稿内容の変更を失敗しました！"
    end
  end

  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy
    redirect_to cooks_path, notice: "投稿を削除しました！"
  end

  private

  def cook_params
    params.require(:cook).permit(:title, :image, :body, :rate, :tag)
  end

  def ensure_guest_user
    if current_customer.name == "guestuser"
      redirect_to customer_path(current_customer) , notice: 'ゲストユーザーは投稿できません！'
    end
  end

end
