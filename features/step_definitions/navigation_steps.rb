When(/^I am on the home page$/) do
  visit '/'
end

When(/^I am in my workout lounge$/) do
  step 'I am on the home page'
  step 'I click on the My Lounge link'
end

When(/^I click on the ([\w\'\s?]+) link$/) do |link|
  click_link link
end

When(/^I click on the ([\w\'\s?]+) button$/) do |button|
  click_button button
end

When(/^I fill in the "([^"]*)" field with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

Then(/^I should find a link to ([\w\'\s?]+)$/) do |link|
  expect(page).to have_link link
end

Then(/^I should find the header (\d) ([\w\s\'?]+)$/) do |size, text|
  expect(page).to have_css "h#{size}", text: text
end
