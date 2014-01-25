class Vs < ActiveRecord::Base
  attr_accessible :own_id, :own_type, :place, :status,:content, :vs_date
  belongs_to :owner, polymorphic: true
end
