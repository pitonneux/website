require 'rails_helper'

RSpec.describe EmailRecipient, type: :model do
  subject { build :email_recipient }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of :email }

  it { is_expected.to belong_to :collectible }
  it { is_expected.to have_and_belong_to_many :group_messages }
end
