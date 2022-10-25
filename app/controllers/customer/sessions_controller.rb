class Customer::SessionsController < Customer::Base
  def new
    if current_customer
      redirect_to :top_index
    else
      @form = Customer::LoginForm.new
      render action: 'new'
    end
  end

  # ログイン
  def create
    @form = Customer::LoginForm.new(login_form_params)
    customer = Customer.find_by('LOWER(email) = ?', @form.email.downcase) if @form.email.present?

    if Customer::Authenticator.new(customer).authenticate(@form.password)
      session[:customer_id] = customer.id
      redirect_to :top_index
    else
      render action: 'new'
    end
  end

  def destroy
    session.delete(:customer_id)
    redirect_to :root, status: :see_other
  end

  private

  def login_form_params
    params.require(:customer_login_form).permit(:email, :password)
  end
end
