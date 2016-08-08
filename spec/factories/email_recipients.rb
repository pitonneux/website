FactoryGirl.define do
  factory :email_recipient do
    sequence :email do |n|
      "user_#{n}@example.com"
    end

    trait :message do
      collectible { create :message }
    end

    trait :visitor do
      collectible { create :visitor }
    end
  end
end
