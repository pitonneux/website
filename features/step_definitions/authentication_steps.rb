Given(/^I have an account$/) do
  FactoryGirl.create :user
end

Given(/^I have an account and am logged in$/) do
  user = FactoryGirl.create :user
  step 'I am on the home page'
  step 'I click on the Log in link'
  step 'I fill in the "Email" field with "test@example.com"'
  step 'I fill in the "Password" field with "password"'
  step 'I click on the Log in button'

  # login_as user, scope: :user, run_callbacks: false
end

Then(/^I should be signed in$/) do
  expect(page).to have_css '.flash-notice', text: 'Signed in successfully.'
end

Then(/^I should be welcomed to the app$/) do
  expect(page).to have_css '.flash-notice', text: 'Welcome! You have signed up successfully.'
end

Then(/^I should be signed out$/) do
  expect(page).to have_css '.flash-notice', text: 'Signed out successfully.'
end
