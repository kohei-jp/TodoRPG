require 'rails_helper'

describe Customer::Authenticator do
  example '正しいパスワードならtrueを返す' do
    c = build(:customer)
    expect(described_class.new(c).authenticate('password')).to be_truthy
  end

  example '誤ったパスワードならfalseを返す' do
    c = build(:customer)
    expect(described_class.new(c).authenticate('pass')).to be_falsey
  end

  example 'パスワード未設定ならfalseを返す' do
    c = build(:customer, password: nil)
    expect(described_class.new(c).authenticate(nil)).to be_falsey
  end

  example '論理削除済みならfalseを返す' do
    c = build(:customer, invalidated_at: Time.current)
    expect(described_class.new(c).authenticate(nil)).to be_falsey
  end
end
