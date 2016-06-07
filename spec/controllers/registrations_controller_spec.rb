require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  before { @request.env['devise.mapping'] = Devise.mappings[:user] }

  describe "GET #new" do
    subject { get :new }

    it { should have_http_status :redirect }
    it { should redirect_to root_path      }
  end
end
