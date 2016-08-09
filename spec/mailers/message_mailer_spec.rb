require 'rails_helper'

# frozen_string_literal: true
RSpec.describe MessageMailer, :vcr, type: :mailer do
  describe 'send_to_admin' do
    let(:message) { create :message }
    let(:mail) { MessageMailer.send_to_admin(message) }

    before do
      ENV['ADMIN_EMAIL'] = 'test@pitonneux.com'
    end

    it 'renders the headers' do
      expect(mail.subject).to eq t('message_mailer.send_to_admin.subject', name: message.sender)
      expect(mail.to).to eq(['test@pitonneux.com'])
      expect(mail.from).to eq(['contact@pitonneux.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match message.content
      expect(mail.body.encoded).to match 'Hi!'
      expect(mail.body.encoded).
        to match "#{message.sender} just sent a message via the website&#39;s contact form:"
    end
  end
end
