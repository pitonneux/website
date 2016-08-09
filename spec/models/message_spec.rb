# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Message, type: :model do
  it { is_expected.to validate_presence_of :sender  }
  it { is_expected.to validate_presence_of :content }

  context 'checking that email regexp' do
    it { is_expected.not_to allow_value('invalid.email')         .for :email }
    it { is_expected.not_to allow_value('@invalid.email')        .for :email }
    it { is_expected.not_to allow_value('invalid@email')         .for :email }
    it { is_expected.to allow_value('looks-like@a-valid.email')  .for :email }
    it { is_expected.to allow_value('email_can@have.underscores').for :email }
  end

  it { is_expected.to have_one(:contact).dependent(:destroy) }

  describe 'callbacks', :vcr do
    it 'creates and email recipient after saving' do
      message = build :message
      expect(message.contact).to be_nil

      message.save

      expect(message.contact.email).to eq message.email
    end

    context 'already have a recipient with that email address' do
      it 'assigns the existing recipient to this message' do
        create :contact, email: 'already@have.this'
        message = build :message, email: 'already@have.this'
        expect(message.contact).to be_nil
        expect(Contact.count).to eq 1

        message.save

        expect(message.contact.email).to eq 'already@have.this'
        expect(Contact.count).to eq 1
      end
    end
  end
end
