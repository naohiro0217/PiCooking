class Admin::CookCommentsController < ApplicationController
  # before_action :authenticate_admin!

  def destroy
    CookComment.find(params[:id]).destroy
    redirect_to admin_cook_path(params[:cook_id])
  end

  private

  def cook_comment_params
    params.require(:cook_comment).permit(:comment)
  end

end
