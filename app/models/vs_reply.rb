class VsReply < ActiveRecord::Base
  attr_accessible :own_id, :own_type, :status, :vs_id
  belongs_to :owner, polymorphic: true
end
