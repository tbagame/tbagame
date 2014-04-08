class ChallengeReply < ActiveRecord::Base
  attr_accessible :challenge_id, :description, :status, :tel

  belongs_to :team
  belongs_to :challenge
end
