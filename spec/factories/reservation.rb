FactoryBot.define do
  factory :reservation do
    association :seance
    sequence(:email) { |n| "example@#{n}.com" }
  end
end
