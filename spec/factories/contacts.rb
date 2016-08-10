# frozen_string_literal: true
FactoryGirl.define do
  factory :contact do
    sequence :email do |n|
      "user_#{n}@example.com"
    end

    trait :message do
      collectible_type 'Message'
    end
  end
end
