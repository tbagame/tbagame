module SessionManager

  def create_session(user, account_name = nil, remember_me = nil)
    session[:user_token] = user.token
    session[:account_name] = account_name
    if remember_me
      cookie_life_time = Time.now + 86400*14
      cookies[:user_token] = {:value => user.token, :expires => cookie_life_time}
    end

    cookies[:tel] = {value: user.tel, :expires => cookie_life_time}
    cookies[:account_name] = {:value => account_name, :expires => cookie_life_time}

  end

  def destroy_session
    session.delete :account_name
    session.delete :pre_url
    session.delete :user_token
    cookies.delete :user_token
    cookies.delete :mobile
    cookies.delete :account_name
  end

  # @return [@current_user]
  def current_user
    user_token = session[:user_token] ? session[:user_token] : cookies[:user_token]
    @current_user ||= user_token && (User.where(token: user_token).first)
  end

  def logged_in?
    !session[:user_token].nil? || !cookies[:user_token].nil?
  end

  def create_manage_session(admin)
    session[:login_admin] = {
        :id => admin.id,
        :name => admin.name,
        :login => admin.login,
        :role => admin.role,
    }
  end

  def destroy_manage_session
    #session.clear
    session[:login_admin] = nil
  end

  def current_manage_user
    @current_manage_user ||= session[:login_admin] && (Admin.find(session[:login_admin][:id]))
  end

  def manage_logged_in?
    !session[:login_admin].nil?
  end
end