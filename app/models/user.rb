# model to describe users
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable,
         :validatable, omniauth_providers: [:facebook]
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :friend_requests, dependent: :destroy
  
  before_save do 
    self.email = email.downcase
  end
  after_create :welcome_email

  def welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      info = auth.info
      user.email = info.email
      user.password = Devise.friendly_token[0,20]
      user.name = info.name
    end
  end

  validates :email, :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
