class Customer::TaskForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :name, :experience_point, :skill_id, :rank_id, :completed_at

  def save
    ActiveRecord::Base.transaction do
      task.save!
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end

  def task
    @task ||= Task.new(
      name:, experience_point:,
      skill_id:, rank_id:, completed_at:
    )
  end
end
