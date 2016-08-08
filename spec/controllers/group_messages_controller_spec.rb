require 'rails_helper'

RSpec.describe GroupMessagesController, type: :controller do
  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it_behaves_like 'action to be authorized with', GroupMessage
      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        it_behaves_like 'successful request'
      end
    end
  end

  describe 'POST #create' do
    let(:group_message_params) { attributes_for :group_message }

    subject { post :create, params: { group_message: group_message_params } }

    it_behaves_like 'action not allowed for guests'

    include_context 'user is logged in' do
      it_behaves_like 'action to be authorized with', GroupMessage
      it_behaves_like 'action that redirects unauthorized user'

      include_context 'user is authorized' do
        context 'with valid params' do
          it 'creates a new group message' do
            expect { subject }.to change(GroupMessage, :count).by 1
          end

          it 'redirects and sets the flash' do
            subject
            expect(response).to redirect_to group_messages_path
            expect(controller).to set_flash[:notice].to 'Message was successfully sent'
          end
        end

        context 'with invalid params' do
          let(:group_message_params) { { message: nil } }

          it 'does not create a new message' do
            expect { subject }.not_to change(GroupMessage, :count)
          end

          it 'sets the flash' do
            subject
            expect(controller).to set_flash[:alert].to 'Message could not be created'
          end
        end
      end
    end
  end
end
