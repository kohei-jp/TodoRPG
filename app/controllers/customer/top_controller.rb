class Customer::TopController < Customer::Base
  def index
    @customer = Customer.find_by(id: session[:customer_id])
    # @avatar = @customer.avatar
    @tasks = Task.valid
  end
end
