FactoryGirl.define do
  factory :message do
    sender 'Test User'
    email 'valid@email.com'
    content 'A nice message'
  end
end
