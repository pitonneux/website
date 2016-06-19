RSpec.describe Location do
  it { is_expected.to validate_presence_of :name }

  it { is_expected.to belong_to :organization    }
  it { is_expected.to have_many :events          }
end
