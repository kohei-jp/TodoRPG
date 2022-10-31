class ExperienceColumn < ApplicationRecord
  # association
  belongs_to :experience_table

  scope :valid, -> { where(invalidated_at: nil) }
end
