class TaskHistory < ApplicationRecord
  scope :valid, -> { where(invalidated_at: nil) }
  scope :todays, -> { where(completed_at: Time.current.all_day) }
  belongs_to :task
  belongs_to :avatar
end
