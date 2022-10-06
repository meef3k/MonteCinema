FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@monte.com" }
    password { 'monte123' }
  end
end
