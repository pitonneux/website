# frozen_string_literal: true
FactoryGirl.define do
  factory :event do
    name 'Learn to code'
    description 'A fun event to go to'
    price '50'
    starts_at { 1.week.from_now }
  end
end
