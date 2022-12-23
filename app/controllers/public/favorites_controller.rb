class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_user, only: [:create, :destroy]

  def create
    @cook = Cook.find(params[:cook_id])
    favorite = current_customer.favorites.new(cook_id: @cook.id)
    favorite.save
  end

  def destroy
    @cook = Cook.find(params[:cook_id])
    favorite = current_customer.favorites.find_by(cook_id: @cook.id)
    favorite.destroy
  end

  private

  def ensure_guest_user
    if current_customer.name == "guestuser"
      redirect_to cooks_path, notice: 'ゲストユーザーはいいねできません！'
    end
  end

end
