class Public::CookCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    cook = Cook.find(params[:cook_id])
    comment = current_customer.cook_comments.new(cook_comment_params)
    comment.cook_id = cook.id
    comment.save
    @cook = Cook.find(params[:cook_id])
    @cook_comment = CookComment.new
  end

  def destroy
    @cook = Cook.find(params[:cook_id])
    @cook_comment = CookComment.find_by(id: params[:id], cook_id: params[:cook_id])
    @cook_comment.destroy
    @cook_comment = CookComment.new
  end

  private

  def cook_comment_params
    params.require(:cook_comment).permit(:comment)
  end

end
