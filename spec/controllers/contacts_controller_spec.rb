# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'GET :index' do
    subject { get :index }

    it_behaves_like 'action not allowed for guests'
    it_behaves_like 'action to be authorized with logged in user', Contact
  end

  describe 'POST #create' do
    let(:contact_params) { attributes_for :contact }

    subject { post :create, params: { contact: contact_params }, format: :js }

    it_behaves_like 'action that is allowed for guests'
    it_behaves_like 'successful request'

    context 'with valid params' do
      it 'creates a new contact' do
        expect { subject }.to change(Contact, :count).by 1
      end
    end

    context 'with invalid params' do
      let(:contact_params) { { email: 'invalid@email' } }

      it 'does not create a new contact' do
        expect { subject }.not_to change(Contact, :count)
      end
    end
  end
end
