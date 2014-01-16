class UserTeamRel < ActiveRecord::Base
  attr_accessible :part, :user_id

  PART_NAMES = [CAPTAIN = 'captain', VICE_CAPTAIN = 'vice_captain',LEADER = 'leader', LINKMAN = 'linkman',COACH = 'coach',ELSE = 'else' ]

  validates_inclusion_of :part, in: PART_NAMES

  belongs_to :user
end
