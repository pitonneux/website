require 'rails_helper'

# frozen_string_literal: true
RSpec.describe MessagesController, type: :controller, js: true do
  describe 'POST #create' do
    context 'with valid params' do
      let(:message_params) do
        { message: { sender: 'sender',
                     email: 'valid@email.com',
                     content: 'A nice message' } }
      end

      let(:mailer) { double 'mailer', deliver_later: true }

      before do
        allow(MessageMailer).to receive(:send_to_admin).and_return mailer
      end

      subject { post :create, params: message_params, format: :js }

      it_behaves_like 'successful request'

      it 'tells the mailer to deliver' do
        post :create, params: message_params, format: :js
        expect(mailer).to have_received :deliver_later
      end
    end

    context 'with invalid params' do
      let(:message_params) do
        { message: { sender: '',
                     email: 'valid@com' } }
      end

      it_behaves_like 'successful request'
    end
  end
end
