# frozen_string_literal: true
FactoryGirl.define do
  factory :group_message do
    message { Faker::Hacker.say_something_smart }
  end
end
