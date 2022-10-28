class Task < ApplicationRecord
  has_many :task_histories, dependent: :destroy
  scope :valid, -> { where(invalidated_at: nil) }
end
