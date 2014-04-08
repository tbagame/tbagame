#encoding:utf-8
module SessionsHelper
  def current_user
    user_token = session[:user_token] ? session[:user_token] : cookies[:user_token]
    @current_user ||= user_token && (User.where(token: user_token).first)
  end
end
