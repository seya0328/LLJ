# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]
  #before_action:user_state, only: [:create]
  
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected

  # def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
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
  # 退会しているかを判断するメソッド
  def user_state
    #byebug
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  #   if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
  # ## 【処理内容3】 falseではなくtrueだった場合にサインアップページにリダイレクト
  #   flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
  #   redirect_to new_user_registration_path
  #   elsif @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
  #   flash[:notice] = "ようこそ"
  #   else 
  #     flash[:notice] = "新規登録お願いします。"
  #     redirect_to new_user_registration_path
  #   end
  
  end
end
