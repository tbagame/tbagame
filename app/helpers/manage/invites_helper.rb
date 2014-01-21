#encoding:utf-8
module Manage
  module InvitesHelper
    def invite_status_list
      [
          ['申请', Invite::COMMON],
          ['通过', Invite::PASS],
          ['拒绝', Invite::REFUSE],
          ['删除', Invite::DELETE],
      ]
    end

    def invite_status_text(status)
      case status
        when Invite::COMMON
          '申请'
        when Invite::PASS
          '通过'
        when Invite::REFUSE
          '拒绝'
        when Invite::DELETE
          '删除'
      end
    end

    def invite_type_list
      [
          ['邀请', Invite::INVITE],
          ['申请', Invite::APPLY],
      ]
    end

    def invite_type_text(type)
      case type
        when Invite::INVITE
          '邀请'
        when Invite::APPLY
          '申请'
      end
    end
  end
end
