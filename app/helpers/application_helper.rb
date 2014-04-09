#encoding:utf-8
module ApplicationHelper

  def status_list
    [
        %w(启用 active),
        %w(停用 stop)
    ]
  end

  def status_text(status)
    case status
      when StatusCode::ACTIVE
        '启用'
      when StatusCode::STOP
        '停用'
    end
  end

  def datetime_input_value(datetime)
    datetime.to_time.strftime('%Y-%m-%d %H:%M') unless datetime.nil?
    end

  def datetime_value_with_ymd(datetime)
    datetime.to_time.strftime('%Y-%m-%d') unless datetime.nil?
  end

  def mobile_with_mask(mobile)
    "#{mobile[0...3]}****#{mobile[-4..-1]}"  unless mobile.blank?
  end

  def map_image(url)
    url.blank? ?  '/css/images/front/map.jpg':url
  end
end
