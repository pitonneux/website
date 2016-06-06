RSpec.describe EventPolicy do
  let(:user) { build_stubbed :user }
  let(:admin) { build_stubbed :user, :admin }

  subject { described_class }

  permissions :index? do
    it { should permit user  }
    it { should permit admin }
  end
end
