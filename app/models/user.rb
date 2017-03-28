class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes
  has_and_belongs_to_many :friends, join_table: 'friends'
  
  before_save do 
    self.email = email.downcase
  end

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
