class Avatar < ApplicationRecord
  # association
  belongs_to :customer

  scope :valid, -> { where(invalidated_at: nil) }
end
