RSpec.describe ApplicationPolicy do
  let(:user)  { build_stubbed :user         }
  let(:admin) { build_stubbed :user, :admin }

  subject { described_class }

  permissions :show?, :create?, :new?, :update?, :edit?, :destroy? do
    it { is_expected.to permit admin    }
    it { is_expected.not_to permit user }
  end
end
