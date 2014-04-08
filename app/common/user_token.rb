require 'bcrypt'
require 'securerandom'
require 'digest'
module UserToken
  def init_user_token
    self.token = Digest::MD5.hexdigest(BCrypt::Password.create("#{DateTime.now.to_s}:#{SecureRandom.uuid}"))
  end

end
