# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Visitor, :vcr, type: :model do
  subject { build :visitor }

  context 'checking that email regexp' do
    it { is_expected.not_to allow_value('invalid.email')         .for :email }
    it { is_expected.not_to allow_value('@invalid.email')        .for :email }
    it { is_expected.not_to allow_value('invalid@email')         .for :email }
    it { is_expected.to allow_value('looks-like@a-valid.email')  .for :email }
    it { is_expected.to allow_value('email_can@have.underscores').for :email }
  end

  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  it { is_expected.to have_one(:contact).dependent(:destroy) }

  describe 'callbacks' do
    it 'calls the calback' do
      expect_any_instance_of(described_class).to receive :set_contact
      create :visitor
    end

    it 'creates an email recipient after saving' do
      visitor = build :visitor
      expect(visitor.contact).to be_nil
      visitor.save
      expect(visitor.contact.email).to eq visitor.email
    end

    context 'already have a recipient with that email address' do
      it 'assigns the existing recipient to this message' do
        create :message, email: 'already@have.this'
        visitor = build :visitor, email: 'already@have.this'
        expect(visitor.contact).to be_nil
        expect(Contact.count).to eq 1

        visitor.save

        expect(visitor.contact.email).to eq 'already@have.this'
        expect(Contact.count).to eq 1
      end
    end
  end
end
