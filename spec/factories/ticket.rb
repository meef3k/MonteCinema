FactoryBot.define do
  factory :ticket do
    association :reservation
    seat { (1..50).to_a.sample }
  end
end
