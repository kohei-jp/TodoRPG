class Customer::OwnedSkillsController < Customer::Base
  def update
    @task = Task.find_by(id: params[:id])
    @customer = current_customer
    Customer::TaskHandler.new(@task, current_customer).completed
    # update.turbo_stream.html.erb を返却
  end
end