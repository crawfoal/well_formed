FactoryBot.define do
  factory :address do
    trait :invalid do
      valid false
    end
  end
end
