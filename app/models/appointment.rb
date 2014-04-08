class Appointment < ActiveRecord::Base
  attr_accessible :appointment_date, :description, :end_time, :start_time, :status, :tel, :user_id
  belongs_to :user
  belongs_to :place
end
