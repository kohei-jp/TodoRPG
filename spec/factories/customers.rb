FactoryBot.define do
  factory :customer do
    sequence(:email) { |n| "customer#{n}@example.com" }
    family_name { '山田' }
    given_name { '太郎' }
    password { 'password' }
  end
end
