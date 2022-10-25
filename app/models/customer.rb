class Customer < ApplicationRecord
  include PasswordHolder

  # association
  has_one :avatar, dependent: :destroy

  scope :valid, -> { where(invalidated_at: nil) }

  def valid?
    invalidated_at.nil?
  end
end
