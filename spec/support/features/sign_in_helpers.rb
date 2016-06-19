# frozen_string_literal: true
module SessionHelpers
  def sign_in(email, password)
    visit new_user_session_path
    fill_form :user, email: email,
                     password: password
    click_on 'Log in'
  end
end
