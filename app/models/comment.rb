class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :post_id, :user_id, :body, presence: true
  scope :chronological_order, -> { order(created_at: :asc) }
end