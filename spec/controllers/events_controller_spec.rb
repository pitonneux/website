# frozen_string_literal: true
require 'rails_helper'

RSpec.describe EventsController do
  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'action that is allowed for guests'
    it_behaves_like 'action to be authorized with', Event

    it 'calls the policy scope' do
      allow(controller).to receive(:policy_scope).with(Event).and_return Event.all
      subject
      expect(controller).to have_received(:policy_scope).with(Event)
    end
  end

  describe 'GET #show' do
    let(:event) { create :event }

    subject { get :show, params: { id: event.id } }

    it_behaves_like 'action that is allowed for guests'

    include_context 'user is logged in' do
      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(event)
        subject
      end

      include_context 'user is authorized' do
        it_behaves_like 'successful request'
      end
    end
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it_behaves_like 'action to be authorized with', Event
      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        it_behaves_like 'successful request'
      end
    end
  end

  describe 'GET #edit' do
    let(:event) { create :event }

    subject { get :edit, params: { id: event.id } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(event)
        get :edit, params: { id: event.id }
      end

      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        it_behaves_like 'successful request'
      end
    end
  end

  describe 'POST #create' do
    let(:event_params) { attributes_for :event }

    subject { post :create, params: { event: event_params } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it_behaves_like 'action to be authorized with', Event
      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        context 'with valid params' do
          it 'creates a new Event' do
            expect do
              post :create, params: { event: event_params }
            end.to change(Event, :count).by(1)
          end

          it 'sets the right flash' do
            post :create, params: { event: event_params }
            expect(response).to redirect_to events_path
            expect(controller).to set_flash[:notice].to 'Event was created successfully'
          end
        end

        context 'with invalid params' do
          let(:invalid_params) { { name: nil, description: nil } }

          it 'creates a new Event' do
            expect do
              post :create, params: { event: invalid_params }
            end.not_to change(Event, :count)
          end

          it 'sets the right flash' do
            post :create, params: { event: invalid_params }
            expect(controller).to set_flash[:alert].to 'Event could not be created'
          end
        end
      end
    end
  end

  describe 'PUT #update' do
    let(:event) { create :event }
    let(:event_params) { { name: 'New Event Name' } }

    subject { put :update, params: { id: event.id, event: event_params } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it_behaves_like 'action to be authorized with', Event
      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        context 'with valid params' do
          it 'updates the event' do
            expect do
              put :update, params: { id: event.id, event: event_params }
              event.reload
            end.to change(event, :name)
          end

          it 'sets the right flash' do
            put :update, params: { id: event.id, event: event_params }
            expect(response).to redirect_to events_path
            expect(controller).to set_flash[:notice].to 'Event was successfully updated'
          end
        end

        context 'with invalid params' do
          let(:invalid_params) { { name: nil } }

          it 'does not update the event' do
            expect do
              put :update, params: { id: event.id, event: invalid_params }
              event.reload
            end.not_to change(event, :name)
          end

          it 'sets the right flash' do
            put :update, params: { id: event.id, event: invalid_params }
            expect(response).to have_http_status :ok
            expect(flash[:alert]).to eq 'Event could not be updated'
          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:event) { create :event }

    subject { delete :destroy, params: { id: event.id } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it_behaves_like 'action that redirects unauthorized user'

      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(event)
        subject
      end

      include_context 'user is authorized' do
        it 'works' do
          subject
          expect(response).to redirect_to events_path
          expect(controller).to set_flash[:notice].to t('events.destroy.success')
        end
      end
    end
  end
end
