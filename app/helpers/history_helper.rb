module HistoryHelper
  
  # 全てのユーザー(非ログインも)の閲覧履歴のDBを作成する
  def current_history
    if logged_in?
      @current_history ||= History.find_by(user_id: current_user.id)
    else
      if session[:history_id]
        @current_history = History.find_by(id: session[:history_id])
      else
        @current_history = History.create
        session[:history_id] = @current_history.id
      end
    end
  end
  
end
