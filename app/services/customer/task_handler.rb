class Customer::TaskHandler
  def initialize(task, customer)
    @task = task
    @customer = customer
    @avatar = customer.avatar
  end

  # タスク完了時の処理
  def completed
    @task.task_histories.create(completed_at: Time.current, avatar_id: @avatar.id)
    owned_skill = OwnedSkill.find_or_create_by(skill_id: @task.skill.id, avatar_id: @avatar.id)
    owned_skill&.add_exp_point(@task.experience_point)
  end
end
