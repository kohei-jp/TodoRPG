class Avatar < ApplicationRecord
  # association
  belongs_to :customer
  has_many :owned_skills, dependent: :destroy
  has_many :task_histories, dependent: :destroy

  scope :valid, -> { where(invalidated_at: nil) }
end
