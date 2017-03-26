class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  has_many :posts
  has_many :comments
  has_and_belongs_to_many :friends
  has_many :likes
  before_save do 
    self.email = email.downcase
    self.name = name.downcase
  end

  
  validates :name, :email, presence: true, 
                           uniqueness: { case_sensitive: false }
end
