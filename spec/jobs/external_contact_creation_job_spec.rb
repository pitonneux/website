require 'rails_helper'

RSpec.describe ExternalContactCreationJob, type: :job do
  EXTERNAL_CONTACT = SendGrid::Contact

  describe '#call' do
    let(:email) { 'test@address.com' }

    it 'calls the external contact creator' do
      expect(EXTERNAL_CONTACT).to receive(:create).with(email: email)
      described_class.new.perform(email: email)
    end
  end
end
