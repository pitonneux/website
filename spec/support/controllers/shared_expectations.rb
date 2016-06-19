# frozen_string_literal: true
def expect_it_to_redirect_guests_and_say_why
  it 'is expected to redirect guests and say why' do
    allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, scope: :user)
    subject
    expect(response).to redirect_to new_user_session_path
    expect(controller).to set_flash[:alert].to 'You need to sign in or sign up before continuing.'
  end
end
