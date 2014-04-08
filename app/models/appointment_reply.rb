class AppointmentReply < ActiveRecord::Base
  attr_accessible :appointment_id, :description, :status, :tel

  belongs_to :appointment
  belongs_to :user

  delegate :name,
    :to => :user,
    :prefix => true
  #delegate :name,
  #  :to => :appointment,
  #  :prefix => true
end
