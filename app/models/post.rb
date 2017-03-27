class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user
  
  validates :user_id, :body, presence: true
end