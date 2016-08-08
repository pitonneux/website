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
    it 'creates an email recipient after saving' do
      visitor = build :visitor
      expect(visitor.email_recipient).to be_nil
      visitor.save
      expect(visitor.email_recipient.email).to eq visitor.email
    end
  end
end
