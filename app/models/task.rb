class Task < ApplicationRecord
  scope :valid, -> { where(invalidated_at: nil) }
end
