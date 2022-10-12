FactoryBot.define do
  factory :seance do
    association :movie
    association :hall
    starts_at { DateTime.now + 3.hours }
    price { 10 }
  end
end
