#encoding:utf-8
module Manage
  module MessagesHelper
    def message_status_list
      [
          ['未读', MessageExpand::COMMON],
          ['已读', MessageExpand::READ],
          ['标记', MessageExpand::MARK],
          ['锁定', MessageExpand::LOCK],
      ]
    end

    def message_status_text(status)
      case status
        when MessageExpand::COMMON
          '未读'
        when MessageExpand::READ
          '已读'
        when MessageExpand::MARK
          '标记'
        when MessageExpand::LOCK
          '锁定'
      end
    end

    def message_type_list
      [
          ['个人', Message::PRIVATE],
          ['公告', Message::PUBLIC],
          ['团队', Message::TEAM],
      ]
    end

    def message_type_text(type)
      case type
        when Message::PRIVATE
          '个人'
        when Message::PUBLIC
          '公告'
        when Message::TEAM
          '团队'
      end
    end
  end
end
