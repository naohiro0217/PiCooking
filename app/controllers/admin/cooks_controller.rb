class Admin::CooksController < ApplicationController
  before_action :authenticate_admin!

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
    @cook_comments = CookComment.all
    @customer = Customer.find(@cook.customer_id)
  end

  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy
    redirect_to admin_cooks_path, notice: "投稿を削除しました！"
  end

  private

  def cook_params
    params.require(:cook).permit(:title, :image, :body, :rate)
  end

end
