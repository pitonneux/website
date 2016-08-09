# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Visitor, type: :model do
  subject { build :visitor }

  context 'checking that email regexp' do
    it { is_expected.not_to allow_value('invalid.email')         .for :email }
    it { is_expected.not_to allow_value('@invalid.email')        .for :email }
    it { is_expected.not_to allow_value('invalid@email')         .for :email }
    it { is_expected.to allow_value('looks-like@a-valid.email')  .for :email }
    it { is_expected.to allow_value('email_can@have.underscores').for :email }
  end

  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  it { is_expected.to have_one(:email_recipient).dependent(:destroy) }

  describe 'callbacks' do
    it 'calls the calback' do
      expect_any_instance_of(described_class).to receive :set_email_recipient
      create :visitor
    end

    it 'creates an email recipient after saving' do
      visitor = build :visitor
      expect(visitor.email_recipient).to be_nil
      visitor.save
      expect(visitor.email_recipient.email).to eq visitor.email
    end

    context 'already have a recipient with that email address' do
      it 'assigns the existing recipient to this message' do
        create :message, email: 'already@have.this'
        visitor = build :visitor, email: 'already@have.this'
        expect(visitor.email_recipient).to be_nil
        expect(EmailRecipient.count).to eq 1

        visitor.save

        expect(visitor.email_recipient.email).to eq 'already@have.this'
        expect(EmailRecipient.count).to eq 1
      end
    end
  end
end
