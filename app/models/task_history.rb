class TaskHistory < ApplicationRecord
  scope :valid, -> { where(invalidated_at: nil) }
  belong_to :task
  belong_to :avatar
end
