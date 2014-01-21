class Invite < ActiveRecord::Base
  attr_accessible :invite_type, :status, :team_id, :user_id

  INVITE_TYPE = [INVITE='invite',APPLY='apply']
  STATUS = [COMMON = 'common',PASS = 'pass',REFUSE='refuse',DELETE='delete']

  belongs_to :user
  belongs_to :team

end
