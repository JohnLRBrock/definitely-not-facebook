class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :post_id, :user_id, :body, presence: true
end