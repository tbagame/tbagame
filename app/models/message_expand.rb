class MessageExpand < ActiveRecord::Base
  attr_accessible :from, :message_id, :status, :to

  MESSAGE_STATUS = [COMMON='common',READ='read',MARK='mark',LOCK='lock']

  belongs_to :message
  belongs_to :from_user,class_name: 'User',foreign_key: 'from'
  belongs_to :to_user,class_name: 'User',foreign_key: 'to'

end
