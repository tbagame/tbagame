class Invite < ActiveRecord::Base
  attr_accessible :invite_type, :status, :team_id, :user_id

  INVITE_TYPE = []

end
