# frozen_string_literal: true
FactoryGirl.define do
  factory :event do
    name { Faker::ChuckNorris.fact }
    description 'A fun event to go to'
    price '50'
    starts_at { 1.week.from_now }
  end
end
