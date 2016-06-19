# RSpec.feature 'visitor signs up' do
#   scenario 'someone tries to sign up' do
#     visit new_user_registration_path
#
#     expect(page).to have content 'You must be invited to access behind the scenes'
#   end
#
#   scenario "with valid email and password" do
#     sign_up_with "valid@example.com", "password"
#
#     expect_user_to_be_signed_in
#   end
#
#   scenario "tries with invalid email" do
#     sign_up_with "invalid_email", "password"
#
#     expect_user_to_be_signed_out
#   end
#
#   scenario "tries with blank password" do
#     sign_up_with "valid@example.com", ""
#
#     expect_user_to_be_signed_out
#   end
# end
