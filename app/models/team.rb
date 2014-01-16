class Team < ActiveRecord::Base
  attr_accessible :area, :declarater, :description, :level, :name, :notice, :power, :region, :status
  has_many :users
end
