FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@monte.com" }
    password { 'monte123' }
    confirmed_at { DateTime.current }
    role { :manager }
  end
end
