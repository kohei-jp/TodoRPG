class Customer::Authenticator
  def initialize(customer)
    @customer = customer
  end
  
  def authenticate(raw_password)
    @customer && @customer.valid? && checked_password(raw_password)
  end

  private
  def checked_password(raw_password)
    return false if raw_password.nil?
    BCrypt::Password.new(@customer.hashed_password) == raw_password
  end
end