# frozen_string_literal: true
FactoryGirl.define do
  factory :email_recipient do
    sequence :email do |n|
      "user_#{n}@example.com"
    end

    trait :message do
      collectible_type 'Message'
    end

    trait :visitor do
      collectible_type 'Visitor'
    end
  end
end
