class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

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

end
