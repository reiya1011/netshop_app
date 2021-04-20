class AccountActivationsController < ApplicationController
   
  # アカウントを有効化を判断する処理 
  def edit
   user = User.find_by(email: params[:email])
   if user && !user.activated? && user.authenticated?(:activation, params[:id])
    user.activate
    log_in user
    flash[:success] = "アカウントを有効化しました"
    redirect_to user
   else
    flash[:danger] = "無効なリンクです、有効化に失敗しました"
    redirect_to root_url
   end 
  end
    
end
