class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :first_name, :last_name, :email, :username, :password_confirmation, :password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  before_save :create_remember_token
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
