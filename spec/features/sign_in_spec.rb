RSpec.feature 'Signing in', :devise do
  scenario 'user cannot sign in if not registered' do
    sign_in('person@exmaple.com', 'password')
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'user can sign in with valid credentials' do
    user = create :user
    sign_in(user.email, user.password)
    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'user cannot sign in with the wrong email' do
    user = create :user
    sign_in('wrong@email.com', user.password)
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'user cannot sign in with the wrong email' do
    user = create :user
    sign_in(user.email, 'wrongpassword')
    expect(page).to have_content 'Invalid email or password'
  end
end

