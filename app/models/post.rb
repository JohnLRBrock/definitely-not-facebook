# post model
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  validates :user_id, :body, presence: true

  scope :feed, ->(ids) { where(user_id: ids).order(created_at: :desc) }
end