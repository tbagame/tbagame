class ApplicationController < ActionController::Base
  include SessionManager

  def get_paging_order_info
    {
        :page => params[:page],
        :limit => params[:limit].nil? ? 2 : params[:limit]
    }
  end

  def datetime_value(datetime)
    datetime.to_time.strftime('%Y-%m-%d %H:%M') unless datetime.nil?
    #datetime.localtime.strftime('%Y-%m-%d %H:%M')
  end

  def check_login
    unless current_user
      session[:pre_url] = request.original_url
      redirect_to('/login')
    end
  end

end
