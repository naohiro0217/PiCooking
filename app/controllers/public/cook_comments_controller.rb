class Public::CookCommentsController < ApplicationController

  before_action :authenticate_customer!

  def create
    cook = Cook.find(params[:cook_id])
    comment = current_customer.cook_comments.new(cook_comment_params)
    comment.cook_id = cook.id
    comment.save
    redirect_to cook_path(cook), notice: "コメントに成功しました！"
  end

  def destroy
    CookComment.find(params[:id]).destroy
    redirect_to cook_path(params[:cook_id]), notice: "コメントを削除しました！"
  end

  private

  def cook_comment_params
    params.require(:cook_comment).permit(:comment)
  end

end
