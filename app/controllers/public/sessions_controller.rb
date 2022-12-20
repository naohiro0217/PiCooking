# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   #before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # ゲストログイン機能
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to customer_path(customer), notice: 'guestuserでログインしました。'
  end

  protected
  # 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
      ## 【処理内容3】
    redirect_to new_customer_session_path, notice: 'このアカウントは退会済です！'
    end
  end
end