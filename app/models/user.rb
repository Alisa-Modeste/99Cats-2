class User < ActiveRecord::Base
  attr_accessible :user_name, :session_token, :password
  attr_accessor :password

  validates :user_name, :session_token, :password_digest, presence: true
  validates :user_name, uniqueness: true

  before_validation do |user|
    user.reset_session_token! if user.session_token.nil?
  end

  def self.find_by_credentials(user_name, password)
    u = User.where(user_name: user_name).first
    return u if u.is_password?(password)

    # raise error?
    nil
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
  end

  def password=(value)
    self.password_digest = BCrypt::Password.create(value)
  end

  def is_password?(value)
    self.password_digest.is_password?(value)
  end

end
