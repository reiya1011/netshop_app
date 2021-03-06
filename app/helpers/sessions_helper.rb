module SessionsHelper
    
  # 渡されたユーザーでログインする
  def log_in(user)
   if user.activated?
    session[:user_id] = user.id
   end
  end
  
  # ユーザーのセッションを永続的にする
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # 永続的セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  
  # 現在のユーザーをログアウトする
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # 現在のユーザーを返す
  def current_user
   if (user_id = session[:user_id])
     @current_user ||= User.find_by(id: user_id)
   elsif (user_id = cookies.signed[:user_id])
     user = User.find_by(id: user_id)
     if user && user.authenticated?(:remember, cookies[:remember_token])
       log_in user
       @current_user = user
     end
   end
  end
  
  # 同じユーザーかチェック
  def current_user?(user)
    user && user == current_user
  end
  
  # ログインしているかチェック
  def logged_in?
    !current_user.nil?
  end

  # 記憶したURLがあればそこにリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  
  # 現在のURLを記憶
  def store_location 
    session[:forwarding_url] = request.original_url if request.get?
  end
  
end
