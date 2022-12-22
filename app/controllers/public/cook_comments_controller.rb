class Public::CookCommentsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_guest_user, only: [:create, :destroy]

  def create
    cook = Cook.find(params[:cook_id])
    comment = current_customer.cook_comments.new(cook_comment_params)
    comment.cook_id = cook.id
    comment.save
    @cook = Cook.find(params[:cook_id])
    @cook_comment = CookComment.new
    #redirect_to cook_path(cook), notice: "コメントに成功しました！"
  end

  def destroy
    @cook = Cook.find(params[:cook_id])
    @cook_comment = CookComment.find_by(id: params[:id], cook_id: params[:cook_id])
    @cook_comment.destroy
    @cook_comment = CookComment.new
    #redirect_to cook_path(params[:cook_id]), notice: "コメントを削除しました！"
  end

  private

  def cook_comment_params
    params.require(:cook_comment).permit(:comment)
  end

  def ensure_guest_user
    if current_customer.name == "guestuser"
      redirect_to customer_path(current_customer) , notice: 'ゲストユーザーはコメントできません！'
    end
  end

end
