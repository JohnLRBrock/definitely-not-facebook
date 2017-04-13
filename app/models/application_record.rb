class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :chronological_order, -> { order(created_at: :asc) }
end
