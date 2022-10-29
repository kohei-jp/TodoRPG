class Task < ApplicationRecord
  has_many :task_histories, dependent: :destroy
  belongs_to :skill
  scope :valid, -> { where(invalidated_at: nil) }
end
