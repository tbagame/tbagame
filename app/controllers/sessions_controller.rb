#encoding:utf-8
class SessionsController < ApplicationController
  #skip_authorize_resource
  #skip_before_filter :check_login
  #layout :false

  def new
  end

  def create
    destroy_session
    account_name = params[:name]
    password = params[:password]
    remember_me = params[:remember_me]

    if (user = User.login_user(account_name, password))
      create_session(user, account_name,remember_me)
      redirect_to session[:pre_url].blank? ?  '/center/index' : session[:pre_url]
    else
      flash[:error] = Tips::LOGIN_ERROR
      redirect_to '/login'
    end
  end

  def logout
    destroy_session
    redirect_to '/login'
  end
end
