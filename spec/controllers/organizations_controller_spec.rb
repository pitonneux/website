require 'rails_helper'

# frozen_string_literal: true
require_relative '../support/controllers/shared_examples.rb'
require_relative '../support/controllers/shared_contexts.rb'

RSpec.describe OrganizationsController do
  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'action not allowed for guests'
    include_examples 'calls authorize with logged in user', Organization
  end

  describe 'GET #edit' do
    let(:organization) { create :organization }

    subject { get :edit, params: { id: organization.id } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(organization)
        get :edit, params: { id: organization.id }
      end

      include_context 'user is authorized' do
        it_behaves_like 'successful request'
      end

      include_examples 'redirects unauthorized user'
    end
  end

  describe 'POST #create' do
    let(:organization_params) { attributes_for :organization }

    subject { post :create, params: { organization: organization_params } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      include_examples 'calls authorize with', Organization
      include_examples 'redirects unauthorized user'

      include_context 'user is authorized' do
        context 'with valid params' do
          it 'creates a new Organization' do
            expect do
              subject
            end.to change(Organization, :count).by(1)
          end

          it 'sets the right flash' do
            subject
            expect(response).to redirect_to organizations_path
            expect(controller).to set_flash[:notice].to t('organizations.create.success')
          end
        end

        context 'with invalid params' do
          let(:invalid_params) { { name: nil } }

          it 'creates a new Organization' do
            expect do
              post :create, params: { organization: invalid_params }
            end.not_to change(Organization, :count)
          end

          it 'sets the right flash' do
            post :create, params: { organization: invalid_params }
            expect(response).to redirect_to organizations_path
            expect(controller).to set_flash[:alert].to t('organizations.create.failure')
          end
        end
      end
    end
  end

  describe 'PUT #update' do
    let(:organization) { create :organization }
    let(:organization_params) { { name: 'New Organization Name' } }

    subject { put :update, params: { id: organization.id, organization: organization_params } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      include_examples 'calls authorize with', Organization
      include_examples 'redirects unauthorized user'

      include_context 'user is authorized' do
        context 'with valid params' do
          it 'updates the organization' do
            expect do
              put :update, params: { id: organization.id, organization: organization_params }
              organization.reload
            end.to change(organization, :name)
          end

          it 'sets the right flash' do
            put :update, params: { id: organization.id, organization: organization_params }
            expect(response).to redirect_to organizations_path
            expect(controller).to set_flash[:notice].to eq t('organizations.update.success')
          end
        end

        context 'with invalid params' do
          let(:invalid_params) { { name: nil } }

          it 'does not update the organization' do
            expect do
              put :update, params: { id: organization.id, organization: invalid_params }
              organization.reload
            end.not_to change(organization, :name)
          end

          it 'sets the right flash' do
            put :update, params: { id: organization.id, organization: invalid_params }
            expect(response).to have_http_status :ok
            expect(flash[:alert]).to eq t('organizations.update.failure')
          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:organization) { create :organization }

    subject { delete :destroy, params: { id: organization.id } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      include_examples 'redirects unauthorized user'

      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(organization)
        subject
      end

      include_context 'user is authorized' do
        it 'works' do
          subject
          expect(response).to redirect_to organizations_path
          expect(controller).to set_flash[:notice].to t('organizations.destroy.success')
        end
      end
    end
  end
end
