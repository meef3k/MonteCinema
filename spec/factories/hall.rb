FactoryBot.define do
  factory :hall do
    sequence(:name) { |n| "Hall #{n}" }
    capacity { 50 }
  end
end
