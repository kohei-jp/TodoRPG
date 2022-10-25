class CustomerPresenter < ModelPresenter
  def full_name
    "#{object.family_name} #{object.given_name}"
  end
end