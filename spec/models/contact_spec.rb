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
    it 'sends the new email address to the external service' do
      expect_any_instance_of(ExternalContactCreationJob).to receive(:perform).with(email: 'new@contact.com')
      create :contact, email: 'new@contact.com'
    end
  end
end
