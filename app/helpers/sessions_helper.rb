module SessionsHelper
  
  #ログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #ログインユーザー情報を返す
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  #ログインでtrue or false
  def logged_in?
    !current_user.nil?
  end
  
  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
