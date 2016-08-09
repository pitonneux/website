# frozen_string_literal: true
require 'rails_helper'

RSpec.describe GroupMessage, type: :model do
  it { is_expected.to have_and_belong_to_many :email_recipients }

  it { is_expected.to validate_presence_of :message }
end
