FactoryGirl.define do
  factory :visitor do
    sequence :email do |n|
      "visitor_#{n}@example.com"
    end
  end
end
