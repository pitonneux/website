FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "user_#{n}@example.com"
    end
    password 'password'
    admin false

    trait :admin do
      admin true
    end
  end
end
