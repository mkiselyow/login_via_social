class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :url
  has_secure_password
  attr_accessible :first_name, :last_name, :email, :username, :password_confirmation, :password, :uid, :provider, :oauth_token, :oauth_expires_at, :skip_valids
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true
  before_save :create_remember_token

  def self.find_for_facebook_oauth access_token
    if user = User.where(:url => access_token.info.urls.Facebook).first
      user
    else 
      User.create!(:provider => access_token.provider, :url => access_token.info.urls.Facebook, :first_name => access_token.extra.raw_info.first_name, :last_name => access_token.extra.raw_info.last_name, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20]) 
    end
  end

  def self.find_for_vkontakte_oauth access_token
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user
    else 
      User.create!(:provider => access_token.provider, :url => access_token.info.urls.Vkontakte, :first_name => access_token.info.first_name, :last_name => access_token.extra.raw_info.domain, :email => access_token.extra.raw_info.domain+'@vk.com', :password => Devise.friendly_token[0,20]) 
    end
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end

