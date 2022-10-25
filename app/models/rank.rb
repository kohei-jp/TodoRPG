class Rank < ApplicationRecord
  scope :valid, -> { where(invalidated_at: nil) }
end
