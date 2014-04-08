class Place < ActiveRecord::Base
  attr_accessible :address, :average_price, :basketry, :business_time, :description, :geohash, :gps_x, :gps_y, :name, :status, :telephone, :transport_info

  has_many :challenges
  has_many :appointments
end
