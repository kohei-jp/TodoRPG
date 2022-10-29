class Skill < ApplicationRecord
  has_many :owned_skills, dependent: :destroy
  has_many :tasks, dependent: :destroy
  scope :valid, -> { where(invalidated_at: nil) }
end
