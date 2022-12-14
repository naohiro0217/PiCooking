class Public::CooksController < ApplicationController
  before_action :authenticate_customer!

  def new
    @cook = Cook.new
  end

  def index
    @cooks = Cook.all.order(params[:sort])
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
    if @cook.save!
      flash[:notice] = "投稿に成功しました。"
      redirect_to cooks_path
    else
      render :new
    end
  end

  def update
    @cook = Cook.find(params[:id])
    if @cook.update(cook_params)
      redirect_to cook_path
    else
      render :edit
    end
  end

  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy
    redirect_to cooks_path
  end

  private

  def cook_params
    params.require(:cook).permit(:title, :image, :body, :rate, :name)
  end


end
