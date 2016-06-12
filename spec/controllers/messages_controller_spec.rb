RSpec.describe MessagesController, type: :controller, js: true do

  describe 'POST #create' do
    context 'with valid params' do
      let(:message_params) do
        { message: { sender: 'sender',
                     email: 'valid@email.com',
                     content: 'A nice message' } }
      end

      it 'works' do
        post :create, params: message_params, format: :js
        expect(response).to have_http_status(:success)
      end

      it 'tells the mailer to deliver' do
        mailer = double 'mailer', deliver: true
        allow(MessageMailer).to receive(:send_to_admin).and_return mailer

        post :create, params: message_params, format: :js
        expect(mailer).to receive :deliver
      end
    end

    context 'with invalid params' do
      let(:message_params) do
        { message: { sender: '',
                     email: 'valid@com' } }
      end

      it 'works' do
        post :create, params: message_params, format: :js
        expect(response).to have_http_status :ok
      end
    end
  end
end
