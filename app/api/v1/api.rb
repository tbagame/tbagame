#encoding:utf-8
module V1
  #class API < Grape::API
  #  rescue_from :all do |e|
  #    case e
  #      #when AccountActionException, Users::UserOperationException, FavoriteStoreOperationException, Users::ModifyMobileOperationException, SmsCaptchaException, BankCardException
  #      #  status_code = 403
  #      #when UnloginException
  #      #  status_code = 419
  #      when ActiveRecord::RecordInvalid
  #        status_code = 422
  #      when ActiveRecord::StaleObjectError
  #        status_code = 409
  #      when ActiveRecord::RecordNotFound
  #        status_code = 404
  #      else
  #        status_code = 500
  #    end
  #    msg = [419, 403].include?(status_code) ? e.message : '系统繁忙'
  #    error_response(status: status_code, message: {msg: msg}, headers: {
  #        'Content-Type' => 'application/json;charset=UTF-8'
  #    })
  #  end
  #
  #  helpers do
  #    def paging_order_info
  #      return {
  #          :page => params[:page],
  #          :limit => params[:limit].nil? ? 20 : params[:limit]
  #      }
  #    end
  #
  #    #def current_user
  #    #  user_token = request.session[:user_token]
  #    #  @user ||= Users::NormalUser.where(token: user_token).first unless user_token.blank?
  #    #  raise UnloginException, 'need login' if @user.nil?
  #    #  @user
  #    #end
  #
  #    #def current_credit_account
  #    #  @current_credit_account ||= Core::CreditAccount.find_by_external_id(current_user.external_id)
  #    #  @current_credit_account || Core::CreditAccount.new #如果出现 @current_credit_account为空的情况，返回一个空对象， 避免抛出nil异常
  #    #end
  #
  #    def create_session(user)
  #      request.session[:user_token] = user.token
  #    end
  #
  #    def destroy_session
  #      request.session[:user_token] = nil
  #    end
  #
  #    def success_response
  #      status 200
  #      {msg: 'success'}
  #    end
  #
  #    def valid_mobile(mobile)
  #      mobile = mobile.to_s.strip
  #      if mobile.length != 11
  #        false
  #      else
  #        mobile =~ /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/
  #      end
  #    end
  #
  #  end
  #
  #  group :v1 do
  #    mount HelloAPI
  #  end
  #end
end