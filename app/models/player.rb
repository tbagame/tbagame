class Player < ActiveRecord::Base
  attr_accessible :alias, :ball_age, :birthday, :description, :height, :name, :number, :pic, :position, :status, :team_id, :user_id, :weight
end
