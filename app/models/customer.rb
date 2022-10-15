class Customer < ApplicationRecord
  include PasswordHolder

  def valid?
    invalidated_at.nil?
  end
  
end
