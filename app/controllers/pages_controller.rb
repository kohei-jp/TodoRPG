class PagesController < ApplicationController
  def home; end

  private

  def current_customer
    @current_customer ||= Customer.find_by(id: session[:customer_id]) if session[:customer_id]
  end
  helper_method :current_customer
end
