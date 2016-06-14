RSpec.describe ApplicationController do
  controller do
    def access_denied
      user_not_authorized
    end
  end

  describe 'user_not_authorized' do
    before do
      @routes.draw { get :access_denied, controller: :anonymous }
    end

    it 'sets the flash when user is unauthorized' do
      request.env["HTTP_REFERER"] = nil
      get :access_denied
      expect(controller).to set_flash[:alert].to t('unauthorized')
      expect(controller).to redirect_to root_path
    end

    it 'redirects back when there is a request referrer' do
      request.env["HTTP_REFERER"] = 'back path'
      get :access_denied
      expect(controller).to redirect_to 'back path'
    end
  end

  describe 'after_sign_in_path' do
    it 'redirects to events after login' do
      user = build_stubbed :user
      expect(controller.after_sign_in_path_for(user)).to eq events_path
    end
  end
end
