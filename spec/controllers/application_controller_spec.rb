RSpec.describe ApplicationController do
  controller do
    def access_denied
      user_not_authorized
    end
  end

  describe 'user_not_authorized' do
    before do
      @routes.draw do
        get :access_denied, controller: :anonymous
      end
    end

    it 'sets the flash when user is unauthorized' do
      get :access_denied
      expect(flash[:alert]).to eq t 'unauthorized'
    end
  end
end
