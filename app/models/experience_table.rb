class ExperienceTable < ApplicationRecord
  # association
  has_many :experience_columns, dependent: :destroy

  scope :valid, -> { where(invalidated_at: nil) }
end
