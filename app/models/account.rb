class Account < ActiveRecord::Base
  attr_accessible :name, :password_digest

  belongs_to :owner, polymorphic: true

  has_secure_password

end
