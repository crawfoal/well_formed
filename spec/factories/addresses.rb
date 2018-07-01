FactoryBot.define do
  factory :address do
    trait :invalid do
      valid false
      after(:build) { |address| address.errors.add(:street, "can't be blank") }
    end
  end
end
