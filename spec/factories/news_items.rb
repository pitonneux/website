# frozen_string_literal: true
FactoryGirl.define do
  factory :news_item do
    title { Faker::Hipster.sentence }
    description { Faker::Hacker.say_something_smart }
  end
end
