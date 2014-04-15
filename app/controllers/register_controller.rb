#encoding:utf-8
class RegisterController < ApplicationController
  def new

  end

  def create
    destroy_session
    flash_return('error', Tips::REGISTER_ERROR, '/register') if params[:agreement].blank?
    begin
      user = User.create_user(params[:name], params[:password], params[:confirm_password])
      create_session(user, params[:name])
      redirect_to session[:pre_url].blank? ? '/center/index' : session[:pre_url]
    rescue AccountActionException
      flash_return('error', Tips::REGISTER_ERROR, '/register')
    rescue StandardError
      flash_return('error', Tips::SYSTEM_ERROR, '/register')
    end
  end

  private
  def flash_return(flag, content = nil, url)
    flash[flag.to_sym] = content
    redirect_to url
  end


end
