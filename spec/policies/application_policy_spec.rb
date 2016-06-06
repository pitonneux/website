RSpec.describe ApplicationPolicy do
  let(:user)  { build_stubbed :user         }
  let(:admin) { build_stubbed :user, :admin }

  subject { described_class }

  permissions :create?, :new? do
    it { is_expected.to permit admin    }
    it { is_expected.not_to permit user }
  end
end
