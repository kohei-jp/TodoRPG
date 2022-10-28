class Avatar < ApplicationRecord
  # association
  belongs_to :customer
  has_many :task_histories, dependent: :destroy

  scope :valid, -> { where(invalidated_at: nil) }
end
