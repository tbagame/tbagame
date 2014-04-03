class Challenge < ActiveRecord::Base
  attr_accessible :challenge_date, :end_time, :start_time, :status, :team_id,:description,:place_id

  belongs_to :place
  belongs_to :team
end
