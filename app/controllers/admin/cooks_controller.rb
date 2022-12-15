class Admin::CooksController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @cooks = Cook.all.order(created_at: :DESC)
  end

  def show
    @cook = Cook.find(params[:id])
    @cook_comments = CookComment.all
    @customer = Customer.find(params[:id])
  end

  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy
    redirect_to admin_cooks_path
  end

  private

  def cook_params
    params.require(:cook).permit(:title, :image, :body, :rate)
  end

end
