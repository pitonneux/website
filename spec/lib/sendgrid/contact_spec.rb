# frozen_string_literal: true
require 'rails_helper'
require 'sendgrid/contact'

RSpec.describe SendGrid::Contact do
  let(:email) { 'hi@test.com' }

  describe '.create' do
    let(:sendgrid) { double 'sendgrid api' }

    before do
      allow_any_instance_of(SendGrid::API).to receive_message_chain('client.contactdb.recipients').and_return sendgrid
    end

    it 'calls sendgrid recipient creation' do
      expect(sendgrid).to receive(:post).with(request_body: Array)
      described_class.create(email: email)
    end
  end

  describe '.email' do
    it 'gives valid JSON' do
      expect(described_class.format(email)).to eq [{ "email": email }]
    end
  end
end
