class Customer::OwnedSkillsController < Customer::Base
  def update
    @task = Task.find_by(id: params[:id])
    task_history = @task.task_histories.create(
      completed_at: Time.current,
      avatar_id: current_customer.avatar.id
    )
    owned_skill = OwnedSkill.find_by(skill_id: @task.skill.id, avatar_id: current_customer.avatar.id)
    owned_skill&.add_exp_point(@task.experience_point)
    @completed_time = task_history.completed_at
    # update.turbo_stream.html.erb を返却
  end
end