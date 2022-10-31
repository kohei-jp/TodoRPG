class AvatarPresenter < ModelPresenter
  def total_experience_point
    object.owned_skills.sum(:experience_point)
  end

  def total_level
    object.owned_skills.sum(:level)
  end
end