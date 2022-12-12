class Public::CooksController < ApplicationController
  # before_action :authenticate_customer!

  def index
    @cooks = Cook.all
    @cook_new = Cook.new
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
    @cook.save!
    redirect_to cooks_path
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
    params.require(:cook).permit(:title, :image, :body, :rate)
  end


end
