require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe '#password=' do
    example '文字列を与えると、hashed_passwordは長さが60文字の文字列になる' do
      customer = described_class.new
      customer.password = 'password_str'
      expect(customer.hashed_password).to be_a(String)
      expect(customer.hashed_password.size).to eq(60)
    end

    example 'nilを与えると、hashed_passwordはnilになる' do
      customer = described_class.new
      customer.password = nil
      expect(customer.hashed_password).to be_nil
    end
  end
end
