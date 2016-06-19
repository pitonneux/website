require 'rails_helper'

# frozen_string_literal: true
RSpec.describe RegistrationsController, type: :controller do
  before { @request.env['devise.mapping'] = Devise.mappings[:user] }

  describe 'GET #new' do
    subject { get :new }

    it { is_expected.to have_http_status :redirect }
    it { is_expected.to redirect_to root_path      }
  end
end
