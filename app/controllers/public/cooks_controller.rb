class Public::CooksController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def new
    @cook = Cook.new
  end

  def index
    customers = Customer.where(is_deleted: false)
    @cooks = []
    customers.each do |customer|
      @cooks.push(customer.cooks&.order(created_at: :DESC))
    end
    @cooks = Kaminari.paginate_array(@cooks.reject(&:blank?).flatten)&.page(params[:page])
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

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end

end
