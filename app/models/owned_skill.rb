class OwnedSkill < ApplicationRecord
  # avatarとskillの中間テーブル。+αでexpやlevelを持っている.
  # association
  belongs_to :avatar
  belongs_to :skill
  scope :valid, -> { where(invalidated_at: nil) }

  def add_exp_point(exp_point)
    update(experience_point: experience_point + exp_point)
  end
end
