class OwnedSkill < ApplicationRecord
  scope :valid, -> { where(invalidated_at: nil) }
end
