class Customer::TasksController < Customer::Base
  # top_controllerのindexアクションに移行
  # def index
  #   @tasks = Task.all
  # end

  def new
    @task = Customer::TaskForm.new
  end

  def create
    @task = Customer::TaskForm.new(task_params)
    @task.save
    redirect_to :top_index
  end

  private

  def task_params
    params.require(:customer_task_form).permit(:name, :experience_point, :skill_id, :rank_id)
  end
end