class Message < ActiveRecord::Base
  attr_accessible :content, :message_type, :pid, :title

  MESSAGE_TYPE = [PRIVATE='private', PUBLIC='public', TEAM='team']

  has_many :message_expands

  def self.create_message!(title, content, message_type, pid, from, to)
    Message.transaction do
      message = Message.new title: title, content: content, message_type: message_type, pid: pid
      message.save!
      to.each do |user_id|
        message_expand = MessageExpand.new
        message_expand.from= from
        message_expand.to = user_id
        message_expand.status=MessageExpand::COMMON
        message_expand.message = message
        message_expand.save!
      end
      return message
    end
  end
end
