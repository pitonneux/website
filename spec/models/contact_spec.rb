# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Contact, :vcr, type: :model do
  subject { build :contact }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of :email }

  it { is_expected.to belong_to :collectible }

  describe 'callbacks' do
    it 'sends the new email address to send grid' do
      expect_any_instance_of(ExternalContactService).to receive(:call).with(email: 'new@contact.com')
      create :contact, email: 'new@contact.com'
    end
  end
end
