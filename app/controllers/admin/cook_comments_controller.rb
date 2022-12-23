class Admin::CookCommentsController < ApplicationController
  before_action :authenticate_admin!

  # 管理者側はdestroyのみ
  def destroy
    @cook = Cook.find(params[:cook_id])
    @cook_comment = CookComment.find_by(id: params[:id], cook_id: params[:cook_id])
    @cook_comment.destroy
  end

  private

  def cook_comment_params
    params.require(:cook_comment).permit(:comment)
  end

end
