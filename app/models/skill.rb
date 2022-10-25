class Skill < ApplicationRecord
  scope :valid, -> { where(invalidated_at: nil) }
end
