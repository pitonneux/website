# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Contact, :vcr, type: :model do
  subject { build :contact }

  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  context 'checking that email regexp' do
    it { is_expected.not_to allow_value('invalid.email')         .for :email }
    it { is_expected.not_to allow_value('@invalid.email')        .for :email }
    it { is_expected.not_to allow_value('invalid@email')         .for :email }
    it { is_expected.to allow_value('looks-like@a-valid.email')  .for :email }
    it { is_expected.to allow_value('email_can@have.underscores').for :email }
  end

  it { is_expected.to belong_to :collectible }

  describe 'callbacks' do
    context 'with valid params' do
      it 'sends the new email address to the external service' do
        allow(ExternalContactCreationJob).to receive(:perform_later)
        create :contact, email: 'new@contact.com'
        expect(ExternalContactCreationJob).to have_received(:perform_later).with(email: 'new@contact.com')
      end
    end

    context 'with invalid params' do
      it 'does not queue the job' do
        contact = build :contact, email: 'invalid@email'
        expect(ExternalContactCreationJob).not_to receive :perform_later
        contact.save
      end
    end
  end
end
