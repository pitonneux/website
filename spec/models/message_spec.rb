require 'rails_helper'

RSpec.describe Message, type: :model do
  it { is_expected.to validate_presence_of :sender  }
  it { is_expected.to validate_presence_of :message }
  it { is_expected.to validate_format_of :email     }
end
