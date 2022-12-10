class Public::CooksController < ApplicationController
  # before_action :authenticate_customer!
  
  def index
    @cooks = Cook.all
    @cook = Cook.new
  end
  
  def show
    @cook = Cook.find(params[:id])
  end
  
  def edit
  end
  
  def create
    @cook = Cook.new(cook_params)
    @cook.customer_id = current_customer.id
    @cook.save
    redirect_to cooks_path
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def cook_params
    params.require(:cook).permit(:title, :image, :body)
  end

  
end
