FactoryBot.define do
  factory :seance do
    association :movie
    association :hall
    starts_at { DateTime.now }
    price { 10 }
  end
end
