# frozen_string_literal: true
require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'action not allowed for guests'
    it_behaves_like 'action to be authorized with logged in user', Location
  end

  describe 'GET #show' do
    let(:location) { create :location }

    subject { get :show, params: { id: location.id } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(location)
        subject
      end

      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        it_behaves_like 'successful request'
      end
    end
  end

  describe 'POST #create' do
    let(:location_params) { attributes_for :location }

    subject { post :create, params: { location: location_params } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it_behaves_like 'action to be authorized with', Location
      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        context 'with valid params' do
          it 'creates a new Location' do
            expect do
              post :create, params: { location: location_params }
            end.to change(Location, :count).by(1)
          end

          it 'redirects and sets the right flash' do
            post :create, params: { location: location_params }
            expect(response).to redirect_to locations_path
            expect(controller).to set_flash[:notice].to t('locations.create.success')
          end
        end

        context 'with invalid params' do
          let(:invalid_params) { { name: nil } }

          it 'does not create a new Location' do
            expect do
              post :create, params: { location: invalid_params }
            end.not_to change(Location, :count)
          end

          it 'sets the right flash' do
            post :create, params: { location: invalid_params }
            expect(response).to redirect_to locations_path
            expect(controller).to set_flash[:alert].to t('locations.create.failure')
          end
        end
      end
    end
  end

  describe 'GET #edit' do
    let(:location) { create :location }

    subject { get :edit, params: { id: location.id } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(location)
        get :edit, params: { id: location.id }
      end

      include_context 'user is authorized' do
        it_behaves_like 'successful request'
      end

      it_behaves_like 'action that redirects unauthorized user'
    end
  end

  describe 'PUT #update' do
    let(:location) { create :location }
    let(:location_params) { { name: 'New Location Name' } }

    subject { put :update, params: { id: location.id, location: location_params } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it_behaves_like 'action to be authorized with', Location
      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        context 'with valid params' do
          it 'updates the location' do
            expect do
              put :update, params: { id: location.id, location: location_params }
              location.reload
            end.to change(location, :name)
          end

          it 'sets the right flash' do
            put :update, params: { id: location.id, location: location_params }
            expect(response).to redirect_to locations_path
            expect(controller).to set_flash[:notice].to eq t('locations.update.success')
          end
        end

        context 'with invalid params' do
          let(:invalid_params) { { name: nil } }

          it 'does not update the location' do
            expect do
              put :update, params: { id: location.id, location: invalid_params }
              location.reload
            end.not_to change(location, :name)
          end

          it 'sets the right flash' do
            put :update, params: { id: location.id, location: invalid_params }
            expect(response).to have_http_status :ok
            expect(flash[:alert]).to eq t('locations.update.failure')
          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:location) { create :location }

    subject { delete :destroy, params: { id: location.id } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it_behaves_like 'action that redirects unauthorized user'

      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(location)
        subject
      end

      include_context 'user is authorized' do
        it 'deletes the resource' do
          expect { subject }.to change(Location, :count).by -1
        end

        it 'redirects and sets the flash' do
          subject
          expect(response).to redirect_to locations_path
          expect(controller).to set_flash[:notice].to t('locations.destroy.success')
        end
      end
    end
  end
end
