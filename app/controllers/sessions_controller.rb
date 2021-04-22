class SessionsController < ApplicationController
  
  before_action :logged_in_user, only: [:destroy]
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        flash[:success] = "ログインしました"
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or(request.referrer)
      else
        message  = "アカウントが有効化されていません. "
        message += "アドレスに送信されたメールを確認してください."
        flash[:success] = message
        redirect_to root_path
      end
    else
     flash[:login_error] = "正しい情報を入力してください"
     redirect_to request.referrer
    end
  end
  
  def destroy
    log_out if logged_in?
    flash[:success] = "ログアウトしました"
    redirect_to root_url
  end
    
end
