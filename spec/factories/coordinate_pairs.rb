FactoryBot.define do
  factory :coordinate_pair do
    trait :invalid do
      valid false
      after(:build) { |cp| cp.errors.add(:latitude, "can't be blank") }
    end
  end
end
