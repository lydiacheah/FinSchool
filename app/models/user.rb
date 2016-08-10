class User < ApplicationRecord
  include Clearance::User

  validates :name, presence: {message: "Please enter your full name."}
  validates :email, presence: {message: "Please enter your email address."}, format: {with: /.+@.+\..+/i, message: "Please enter a valid email address."}
  # validates :password, presence: {message: "Please enter a password."}
  validates :nickname, length: {maximum: 12}

  has_many :authentications, dependent: :destroy
  has_many :profiles, dependent: :destroy

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.name = auth_hash[:extra][:raw_info][:name]
      u.email = auth_hash[:extra][:raw_info][:email]
      u.encrypted_password = SecureRandom.hex(10)
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end
end
