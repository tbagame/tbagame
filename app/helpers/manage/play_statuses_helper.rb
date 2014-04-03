#encoding:utf-8
module Manage
  module PlayStatusesHelper
    def play_status_list
      [
          ['空闲', PlayStatus::FREE],
          ['忙碌', PlayStatus::BUSY],
      ]
    end

    def play_status_text(status)
      case status
        when PlayStatus::FREE
          '空闲'
        when PlayStatus::BUSY
          '忙碌'
      end
    end
  end
end
