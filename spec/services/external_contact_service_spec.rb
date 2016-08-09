# frozen_string_literal: true
require 'rails_helper'
# require 'lib/sendgrid/contact'

RSpec.describe ExternalContactService do
  EXTERNAL_CONTACT = SendGrid::Contact

  describe '#call' do
    let(:address) { 'test@address.com' }

    it 'calls the external contact creator' do
      expect(EXTERNAL_CONTACT).to receive(:create).with(email: address)
      described_class.new.call(email: address)
    end
  end
end
