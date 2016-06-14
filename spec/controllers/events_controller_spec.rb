RSpec.describe EventsController do
  describe 'GET #index' do
    context 'guest tries to access' do
      before do
        allow(request.env['warden'])
          .to receive(:authenticate!)
          .and_throw(:warden, {scope: :user})
      end

      it 'redirects' do
        get :index
        expect(response).to redirect_to new_user_session_path
        expect(controller).to set_flash[:alert].to 'You need to sign in or sign up before continuing.'
      end
    end

    context 'user is signed in' do
      before do
        user = double('user')
        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
        # allow(controller).to receive(:current_user).and_return(user)
      end

      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(Event)
        get :index
      end
    end
  end

  describe 'GET #show' do
    let(:event) { create :event }

    context 'guest tries to access' do
      before do
        allow(request.env['warden'])
          .to receive(:authenticate!)
          .and_throw(:warden, {scope: :user})
      end

      it 'redirects' do
        get :show, params: { id: event.id }
        expect(response).to redirect_to new_user_session_path
        expect(controller).to set_flash[:alert].to 'You need to sign in or sign up before continuing.'
      end
    end

    context 'user is logged in' do
      before do
        user = double 'user'
        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      end

      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(event)
        get :show, params: { id: event.id }
      end

      context 'user is authorized' do
        it 'works' do
          allow(controller).to receive(:authorize).and_return true
          get :show, params: { id: event.id }
          expect(response).to have_http_status :success
        end
      end

      context 'user is unauthorized' do
        it 'redirects' do
          get :show, params: { id: event.id }
          expect(response).to have_http_status :redirect
          expect(controller).to set_flash[:alert].to 'You are not authorized to perform this action'
        end
      end
    end
  end

  describe 'GET #edit' do
    let(:event) { create :event }

    context 'guest tries to access' do
      before do
        allow(request.env['warden'])
        .to receive(:authenticate!)
        .and_throw(:warden, {scope: :user})
      end

      it 'redirects' do
        get :edit, params: { id: event.id }
        expect(response).to redirect_to new_user_session_path
        expect(controller).to set_flash[:alert].to 'You need to sign in or sign up before continuing.'
      end
    end

    context 'user is logged in' do
      before do
        user = double 'user'
        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      end

      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(event)
        get :edit, params: { id: event.id }
      end

      context 'user is authorized' do
        it 'works' do
          allow(controller).to receive(:authorize).and_return true
          get :edit, params: { id: event.id }
          expect(response).to have_http_status :success
        end
      end

      context 'user is unauthorized' do
        it 'redirects' do
          get :edit, params: { id: event.id }
          expect(response).to have_http_status :redirect
          expect(controller).to set_flash[:alert].to 'You are not authorized to perform this action'
        end
      end
    end
  end

  describe 'POST #create' do
    let(:event_params) { attributes_for :event }

    context 'guest tries to access' do
      before do
        allow(request.env['warden'])
        .to receive(:authenticate!)
        .and_throw(:warden, {scope: :user})
      end

      it 'redirects' do
        post :create, params: { event: event_params }
        expect(response).to redirect_to new_user_session_path
        expect(controller).to set_flash[:alert].to 'You need to sign in or sign up before continuing.'
      end
    end

    context 'user is logged in' do
      before do
        user = double 'user'
        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      end

      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(Event)
        post :create, params: { event: event_params }
      end

      context 'user is unauthorized' do
        it 'redirects and says why' do
          post :create, params: { event: event_params }
          expect(response).to have_http_status :redirect
          expect(controller).to set_flash[:alert].to 'You are not authorized to perform this action'
        end
      end

      context 'user is authorized' do
        before { allow(controller).to receive(:authorize).and_return true }

        context 'with valid params' do
          it 'creates a new Event' do
            expect {
              post :create, params: { event: event_params }
            }.to change(Event, :count).by(1)
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
            expect {
              post :create, params: { event: invalid_params }
            }.not_to change(Event, :count)
          end

          it 'sets the right flash' do
            post :create, params: { event: invalid_params }
            expect(response).to redirect_to events_path
            expect(controller).to set_flash[:alert].to 'Event could not be created'
          end
        end
      end
    end
  end

  describe 'PUT #update' do
    let(:event) { create :event }
    let(:event_params) { { name: 'New Event Name' } }

    context 'guest tries to access' do
      before do
        allow(request.env['warden'])
        .to receive(:authenticate!)
        .and_throw(:warden, {scope: :user})
      end

      it 'redirects' do
        put :update, params: { id: event.id, event: event_params }
        expect(response).to redirect_to new_user_session_path
        expect(controller).to set_flash[:alert].to 'You need to sign in or sign up before continuing.'
      end
    end

    context 'user is logged in' do
      before do
        user = double 'user'
        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      end

      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(Event)
        put :update, params: { id: event.id, event: event_params }
      end

      context 'user is unauthorized' do
        it 'redirects and says why' do
          put :update, params: { id: event.id, event: event_params }
          expect(response).to have_http_status :redirect
          expect(controller).to set_flash[:alert].to 'You are not authorized to perform this action'
        end
      end

      context 'user is authorized' do
        before { allow(controller).to receive(:authorize).and_return true }

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
            expect(flash[:alert]).to eq "Event could not be updated"
          end
        end
      end
    end
  end

  describe "DELETE #destroy" do
    let(:event) { create :event }

    context 'guest tries to access' do
      before do
        allow(request.env['warden'])
          .to receive(:authenticate!)
          .and_throw(:warden, {scope: :user})
      end

      it 'redirects' do
        delete :destroy, params: { id: event.id }
        expect(response).to redirect_to new_user_session_path
        expect(controller).to set_flash[:alert].to 'You need to sign in or sign up before continuing.'
      end
    end

    context 'user is logged in' do
      before do
        user = double 'user'
        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      end

      it 'calls authorize' do
        expect(controller).to receive(:authorize).with(event)
        delete :destroy, params: { id: event.id }
      end

      context 'user is authorized' do
        it 'works' do
          allow(controller).to receive(:authorize).and_return true
          delete :destroy, params: { id: event.id }
          expect(response).to redirect_to events_path
          expect(controller).to set_flash[:notice].to 'Event was successfully destroyed'
        end
      end

      context 'user is unauthorized' do
        it 'redirects' do
          delete :destroy, params: { id: event.id }
          expect(response).to have_http_status :redirect
          expect(controller).to set_flash[:alert].to 'You are not authorized to perform this action'
        end
      end
    end
  end
end
