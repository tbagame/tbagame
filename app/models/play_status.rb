class PlayStatus < ActiveRecord::Base
  attr_accessible :end_time, :own_id, :own_type, :start_time, :status, :week_day
  belongs_to :owner, polymorphic: true
end
