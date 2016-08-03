# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Visitor, type: :model do
  subject { FactoryGirl.build :visitor }

  context 'checking that email regexp' do
    it { is_expected.not_to allow_value('invalid.email')         .for :email }
    it { is_expected.not_to allow_value('@invalid.email')        .for :email }
    it { is_expected.not_to allow_value('invalid@email')         .for :email }
    it { is_expected.to allow_value('looks-like@a-valid.email')  .for :email }
    it { is_expected.to allow_value('email_can@have.underscores').for :email }
  end

  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
end
